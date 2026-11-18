import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:globerce_app/app.dart';
import 'package:globerce_app/config/dependencies.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository_fake.dart';
import 'package:provider/provider.dart';

Future<void> _pumpApp(WidgetTester tester) async {
  await tester.pumpWidget(
    MultiProvider(
      providers: fakeProviders(
        auth: AuthRepositoryFake(latency: Duration.zero),
      ),
      child: const GloberceApp(),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> _login(WidgetTester tester, String email, String password) async {
  await tester.enterText(find.byType(TextField).at(0), email);
  await tester.enterText(find.byType(TextField).at(1), password);
  await tester.tap(find.text('Entrar'));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('arranca en el login sin sesión guardada', (tester) async {
    await _pumpApp(tester);

    expect(find.text('Iniciar sesión'), findsOneWidget);
    expect(find.text('¿La olvidaste?'), findsOneWidget);
  });

  testWidgets('muestra los errores de campo al enviar vacío', (tester) async {
    await _pumpApp(tester);

    await tester.tap(find.text('Entrar'));
    await tester.pumpAndSettle();

    expect(find.text('Escribe tu correo.'), findsOneWidget);
    expect(find.text('Escribe tu contraseña.'), findsOneWidget);
  });

  testWidgets('con datos malos muestra el mensaje y se queda', (tester) async {
    await _pumpApp(tester);

    await _login(tester, 'duena@globerce.test', 'otra');

    expect(find.text('Correo o contraseña incorrectos.'), findsOneWidget);
    expect(find.text('Iniciar sesión'), findsOneWidget);
  });

  testWidgets('dueña con dos tiendas: elige una y llega al inicio', (
    tester,
  ) async {
    await _pumpApp(tester);

    await _login(
      tester,
      'duena@globerce.test',
      AuthRepositoryFake.demoPassword,
    );
    expect(find.text('¿Con cuál tienda vas a trabajar?'), findsOneWidget);

    await tester.tap(find.text('Brisa Caribe'));
    await tester.pumpAndSettle();

    expect(find.text('Hola, Valentina'), findsOneWidget);
    expect(find.text('Estás en Brisa Caribe'), findsOneWidget);

    await tester.tap(find.text('Cerrar sesión'));
    await tester.pumpAndSettle();
    expect(find.text('Iniciar sesión'), findsOneWidget);
  });
}
