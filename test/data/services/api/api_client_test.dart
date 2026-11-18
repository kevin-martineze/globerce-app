import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:globerce_app/data/services/api/api_client.dart';

/// Responde según el token: `Bearer new` pasa, cualquier otro recibe 401.
class _Adapter implements HttpClientAdapter {
  final List<String?> authHeaders = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final auth = options.headers['Authorization'];
    authHeaders.add(auth is String ? auth : null);

    final ok = auth == 'Bearer new';
    return ResponseBody.fromString(
      jsonEncode(
        ok
            ? {'ok': true}
            : {
                'statusCode': 401,
                'message': 'No autorizado.',
                'error': 'Unauthorized',
              },
      ),
      ok ? 200 : 401,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

class _Tokens implements SessionTokens {
  _Tokens({required this.refreshSucceeds});

  final bool refreshSucceeds;
  int refreshCalls = 0;

  @override
  String? accessToken = 'old';

  @override
  Future<bool> refreshAccessToken() async {
    refreshCalls++;
    if (!refreshSucceeds) return false;
    accessToken = 'new';
    return true;
  }
}

void main() {
  late _Adapter adapter;
  late ApiClient client;

  ApiClient build(_Tokens tokens) {
    adapter = _Adapter();
    final dio = Dio(BaseOptions(baseUrl: 'http://api.test/v1'))
      ..httpClientAdapter = adapter;
    return ApiClient(baseUrl: 'http://api.test/v1', dio: dio)
      ..sessionTokens = tokens;
  }

  test('pone el access token en cada petición', () async {
    final tokens = _Tokens(refreshSucceeds: true)..accessToken = 'new';
    client = build(tokens);

    await client.dio.get<Object?>('/orders');

    expect(adapter.authHeaders, ['Bearer new']);
    expect(tokens.refreshCalls, 0);
  });

  test('ante un 401 refresca una vez y reintenta con el token nuevo', () async {
    final tokens = _Tokens(refreshSucceeds: true);
    client = build(tokens);

    final response = await client.dio.get<Object?>('/orders');

    expect(response.statusCode, 200);
    expect(adapter.authHeaders, ['Bearer old', 'Bearer new']);
    expect(tokens.refreshCalls, 1);
  });

  test(
    'si el refresh falla, devuelve el 401 original sin reintentar',
    () async {
      final tokens = _Tokens(refreshSucceeds: false);
      client = build(tokens);

      await expectLater(
        client.dio.get<Object?>('/orders'),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status',
            401,
          ),
        ),
      );
      expect(adapter.authHeaders, ['Bearer old']);
    },
  );

  test('las rutas que manejan su propio 401 no disparan el refresh', () async {
    final tokens = _Tokens(refreshSucceeds: true);
    client = build(tokens);

    await expectLater(
      client.dio.post<Object?>(
        '/auth/refresh',
        options: Options(extra: {ApiExtra.skipSessionRefresh: true}),
      ),
      throwsA(isA<DioException>()),
    );
    expect(tokens.refreshCalls, 0);
  });
}
