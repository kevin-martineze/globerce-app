import 'package:flutter_test/flutter_test.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/routing/router.dart';
import 'package:globerce_app/routing/routes.dart';

void main() {
  test('sin saber la sesión, se queda en el arranque', () {
    expect(redirectFor(AuthStatus.unknown, Routes.home), Routes.splash);
    expect(redirectFor(AuthStatus.unknown, Routes.splash), isNull);
  });

  test('sin sesión, todo lleva al login', () {
    expect(redirectFor(AuthStatus.signedOut, Routes.home), Routes.login);
    expect(redirectFor(AuthStatus.signedOut, Routes.stores), Routes.login);
    expect(redirectFor(AuthStatus.signedOut, Routes.login), isNull);
  });

  test('con varias tiendas, primero el selector', () {
    expect(redirectFor(AuthStatus.choosingStore, Routes.home), Routes.stores);
  });

  test('con sesión, el login y el arranque llevan al inicio; el selector sigue abierto', () {
    expect(redirectFor(AuthStatus.signedIn, Routes.login), Routes.home);
    expect(redirectFor(AuthStatus.signedIn, Routes.splash), Routes.home);
    expect(redirectFor(AuthStatus.signedIn, Routes.stores), isNull);
    expect(redirectFor(AuthStatus.signedIn, Routes.home), isNull);
  });
}
