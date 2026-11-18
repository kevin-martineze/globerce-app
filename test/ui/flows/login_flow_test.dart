import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:globerce_app/app.dart';
import 'package:globerce_app/config/dependencies.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository_fake.dart';
import 'package:globerce_app/data/repositories/orders/orders_repository_fake.dart';
import 'package:globerce_app/ui/orders/widgets/order_detail_screen.dart';
import 'package:provider/provider.dart';

import '../../../testing/orders.dart';

Future<void> _pumpApp(WidgetTester tester) async {
  await tester.pumpWidget(
    MultiProvider(
      providers: fakeProviders(
        auth: AuthRepositoryFake(latency: Duration.zero),
        orders: (auth) => OrdersRepositoryFake(
          auth: auth,
          latency: Duration.zero,
          now: () => testNow,
        ),
      ),
      child: const GloberceApp(),
    ),
  );
  await tester.pumpAndSettle();
}

/// Baja en el detalle del pedido hasta que [finder] quede en pantalla.
///
/// `scrollUntilVisible` se detiene apenas el elemento existe, y la lista ya lo
/// construyó fuera de la vista; `ensureVisible` lo trae a la pantalla.
Future<void> _revealInDetail(WidgetTester tester, Finder finder) async {
  await tester.scrollUntilVisible(
    finder,
    200,
    scrollable: find
        .descendant(
          of: find.byType(OrderDetailScreen),
          matching: find.byType(Scrollable),
        )
        .first,
  );
  await tester.ensureVisible(finder);
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

    await tester.tap(find.text('Más'));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text('Cerrar sesión'), 200);
    await tester.tap(find.text('Cerrar sesión'));
    await tester.pumpAndSettle();
    expect(find.text('Iniciar sesión'), findsOneWidget);
  });

  testWidgets('equipo de una tienda: entra directo y ve su tienda en Más', (
    tester,
  ) async {
    await _pumpApp(tester);

    await _login(
      tester,
      'equipo@globerce.test',
      AuthRepositoryFake.demoPassword,
    );
    expect(find.text('Hola, Camilo'), findsOneWidget);

    await tester.tap(find.text('Más'));
    await tester.pumpAndSettle();

    expect(find.text('Lino & Algodón'), findsOneWidget);
    expect(find.text('Cupones'), findsOneWidget);
  });

  testWidgets('el resumen muestra las cifras de la tienda', (tester) async {
    await _pumpApp(tester);
    await _login(
      tester,
      'equipo@globerce.test',
      AuthRepositoryFake.demoPassword,
    );

    expect(find.text('Por responder'), findsOneWidget);
    expect(find.text('1 lleva más de un día'), findsOneWidget);
    expect(find.text('Ventas del mes'), findsOneWidget);
  });

  testWidgets('pedidos: filtra, abre uno y lo confirma', (tester) async {
    await _pumpApp(tester);
    await _login(
      tester,
      'equipo@globerce.test',
      AuthRepositoryFake.demoPassword,
    );

    await tester.tap(find.text('Pedidos').last);
    await tester.pumpAndSettle();
    expect(find.text('26 pedidos'), findsOneWidget);

    await tester.tap(find.text('Pendientes'));
    await tester.pumpAndSettle();
    expect(find.text('4 pedidos'), findsOneWidget);

    await tester.tap(find.text('#1026'));
    await tester.pumpAndSettle();
    expect(find.text('Pedido #1026'), findsOneWidget);

    await _revealInDetail(tester, find.text('Confirmado'));
    await tester.tap(find.text('Confirmado'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Pedidos').first);
    await tester.pumpAndSettle();
    expect(find.text('3 pedidos'), findsOneWidget);
  });

  testWidgets('cancelar un pedido pide confirmación', (tester) async {
    await _pumpApp(tester);
    await _login(
      tester,
      'equipo@globerce.test',
      AuthRepositoryFake.demoPassword,
    );

    await tester.tap(find.text('Pedidos').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('#1026'));
    await tester.pumpAndSettle();

    await _revealInDetail(tester, find.text('Cancelado'));
    await tester.tap(find.text('Cancelado'));
    await tester.pumpAndSettle();
    expect(find.text('¿Cancelar el pedido #1026?'), findsOneWidget);

    await tester.tap(find.text('No, dejarlo así'));
    await tester.pumpAndSettle();
    expect(find.text('¿Cancelar el pedido #1026?'), findsNothing);
    expect(
      find.text('Cancelar devuelve el stock al inventario y libera el cupón.'),
      findsOneWidget,
    );
  });

  testWidgets('inventario sigue en la web por ahora', (tester) async {
    await _pumpApp(tester);
    await _login(
      tester,
      'equipo@globerce.test',
      AuthRepositoryFake.demoPassword,
    );

    await tester.tap(find.text('Inventario'));
    await tester.pumpAndSettle();
    expect(find.text('Muy pronto, tu inventario aquí'), findsOneWidget);
  });
}
