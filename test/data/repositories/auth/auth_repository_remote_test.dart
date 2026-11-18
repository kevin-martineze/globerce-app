import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository_remote.dart';
import 'package:globerce_app/data/services/api/models/session_response.dart';
import 'package:globerce_app/domain/models/session.dart';
import 'package:globerce_app/utils/result.dart';

import '../../../../testing/fakes.dart';

void main() {
  late FakeAuthApi api;
  late InMemorySessionStorage storage;
  late AuthRepositoryRemote repo;

  setUp(() {
    api = FakeAuthApi();
    storage = InMemorySessionStorage();
    repo = AuthRepositoryRemote(api: api, storage: storage);
  });

  group('login', () {
    test('guarda el refresh token y entra con una tienda', () async {
      api.onLogin = (_, _) async => Result.ok(sessionResponse());

      final result = await repo.login(
        email: 'duena@globerce.test',
        password: 'x',
      );

      expect(result, isA<Ok<Session>>());
      expect(storage.refreshToken, 'refresh-1');
      expect(repo.accessToken, 'access-1');
      expect(repo.status, AuthStatus.signedIn);
      expect(repo.session?.activeStore?.role, StoreRole.owner);
    });

    test('con varias tiendas pasa al selector', () async {
      api.onLogin = (_, _) async => Result.ok(
        sessionResponse(
          stores: const [
            SessionStoreDto(id: 'a', name: 'A', slug: 'a', role: 'OWNER'),
            SessionStoreDto(id: 'b', name: 'B', slug: 'b', role: 'STAFF'),
          ],
          activeStoreId: 'a',
        ),
      );

      await repo.login(email: 'duena@globerce.test', password: 'x');

      expect(repo.status, AuthStatus.choosingStore);
    });

    test('sin tiendas cierra la sesión recién abierta en la API', () async {
      api.onLogin = (_, _) async =>
          Result.ok(sessionResponse(stores: const [], activeStoreId: null));

      final result = await repo.login(email: 'x@y.co', password: 'x');

      expect((result as Error<Session>).error.code, AuthErrorCode.noStores);
      expect(api.logoutCalls, ['refresh-1']);
      expect(storage.refreshToken, isNull);
    });
  });

  group('refresh', () {
    test('varias peticiones a la vez comparten un solo refresh', () async {
      storage.refreshToken = 'refresh-1';
      final gate = Completer<Result<SessionResponse>>();
      api.onRefresh = (_) => gate.future;

      final calls = [
        repo.refreshAccessToken(),
        repo.refreshAccessToken(),
        repo.refreshAccessToken(),
      ];
      await Future<void>.delayed(Duration.zero);
      gate.complete(
        Result.ok(
          sessionResponse(accessToken: 'access-2', refreshToken: 'refresh-2'),
        ),
      );

      expect(await Future.wait(calls), [true, true, true]);
      expect(api.refreshCalls, ['refresh-1']);
      expect(storage.refreshToken, 'refresh-2');
      expect(repo.accessToken, 'access-2');
    });

    test(
      'un refresh después de otro usa el token nuevo, nunca el viejo',
      () async {
        storage.refreshToken = 'refresh-1';
        var n = 1;
        api.onRefresh = (_) async {
          n++;
          return Result.ok(sessionResponse(refreshToken: 'refresh-$n'));
        };

        await repo.refreshAccessToken();
        await repo.refreshAccessToken();

        expect(api.refreshCalls, ['refresh-1', 'refresh-2']);
      },
    );

    test('si la API dice 401, borra la sesión y manda al login', () async {
      storage.refreshToken = 'refresh-1';
      api.onRefresh = (_) async => const Result.error(unauthorized);

      expect(await repo.refreshAccessToken(), isFalse);
      expect(storage.refreshToken, isNull);
      expect(repo.status, AuthStatus.signedOut);
    });
  });

  group('restore', () {
    test('sin token guardado va al login sin llamar a la API', () async {
      await repo.restore();

      expect(repo.status, AuthStatus.signedOut);
      expect(api.refreshCalls, isEmpty);
    });

    test('con token guardado entra', () async {
      storage.refreshToken = 'refresh-1';
      api.onRefresh = (_) async =>
          Result.ok(sessionResponse(refreshToken: 'refresh-2'));

      await repo.restore();

      expect(repo.status, AuthStatus.signedIn);
      expect(storage.refreshToken, 'refresh-2');
    });

    test('sin conexión conserva el token y se queda esperando', () async {
      storage.refreshToken = 'refresh-1';
      api.onRefresh = (_) async => const Result.error(offline);

      final result = await repo.restore();

      expect(result, isA<Error<void>>());
      expect(repo.status, AuthStatus.unknown);
      expect(storage.refreshToken, 'refresh-1');
    });
  });

  test('cambiar de tienda rota el token guardado', () async {
    api.onLogin = (_, _) async => Result.ok(
      sessionResponse(
        stores: const [
          SessionStoreDto(id: 'a', name: 'A', slug: 'a', role: 'OWNER'),
          SessionStoreDto(id: 'b', name: 'B', slug: 'b', role: 'OWNER'),
        ],
        activeStoreId: 'a',
      ),
    );
    await repo.login(email: 'duena@globerce.test', password: 'x');

    String? presented;
    api.onSwitchStore = (storeId, refreshToken) async {
      presented = refreshToken;
      return Result.ok(
        sessionResponse(
          refreshToken: 'refresh-b',
          stores: const [
            SessionStoreDto(id: 'a', name: 'A', slug: 'a', role: 'OWNER'),
            SessionStoreDto(id: 'b', name: 'B', slug: 'b', role: 'OWNER'),
          ],
          activeStoreId: storeId,
        ),
      );
    };

    await repo.selectStore('b');

    expect(presented, 'refresh-1');
    expect(storage.refreshToken, 'refresh-b');
    expect(repo.session?.activeStoreId, 'b');
    expect(repo.status, AuthStatus.signedIn);
  });

  test('logout borra lo local aunque la API no responda', () async {
    storage.refreshToken = 'refresh-1';

    await repo.logout();

    expect(storage.refreshToken, isNull);
    expect(repo.status, AuthStatus.signedOut);
    expect(api.logoutCalls, ['refresh-1']);
  });
}
