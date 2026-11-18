import 'package:flutter_test/flutter_test.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository_fake.dart';
import 'package:globerce_app/ui/auth/login/view_models/login_view_model.dart';

void main() {
  late AuthRepositoryFake auth;
  late LoginViewModel vm;

  setUp(() {
    auth = AuthRepositoryFake(latency: Duration.zero);
    vm = LoginViewModel(auth: auth);
  });

  tearDown(() => vm.dispose());

  test('no muestra errores de campo antes del primer envío', () {
    expect(vm.emailError, isNull);
    expect(vm.passwordError, isNull);
  });

  test('valida el correo y la contraseña sin llamar al repositorio', () async {
    vm.setEmail('no-es-correo');
    await vm.submit();

    expect(vm.emailError, LoginFieldError.invalid);
    expect(vm.passwordError, LoginFieldError.required);
    expect(auth.status, AuthStatus.unknown);
  });

  test('con datos correctos y una tienda, entra', () async {
    vm
      ..setEmail('  equipo@globerce.test ')
      ..setPassword(AuthRepositoryFake.demoPassword);
    await vm.submit();

    expect(vm.login.completed, isTrue);
    expect(auth.status, AuthStatus.signedIn);
  });

  test('con varias tiendas, pasa al selector', () async {
    vm
      ..setEmail('duena@globerce.test')
      ..setPassword(AuthRepositoryFake.demoPassword);
    await vm.submit();

    expect(auth.status, AuthStatus.choosingStore);
  });

  test(
    'con datos malos, muestra el mensaje de la API y lo borra al escribir',
    () async {
      vm
        ..setEmail('duena@globerce.test')
        ..setPassword('otra');
      await vm.submit();

      expect(vm.login.error?.message, 'Correo o contraseña incorrectos.');

      vm.setPassword('otra2');
      expect(vm.login.error, isNull);
    },
  );

  test('sin tiendas, devuelve no_stores', () async {
    vm
      ..setEmail('sin-tienda@globerce.test')
      ..setPassword(AuthRepositoryFake.demoPassword);
    await vm.submit();

    expect(vm.login.error?.code, AuthErrorCode.noStores);
    expect(auth.status, isNot(AuthStatus.signedIn));
  });
}
