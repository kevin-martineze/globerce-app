import 'package:flutter_test/flutter_test.dart';
import 'package:globerce_app/domain/models/order.dart';
import 'package:globerce_app/ui/summary/view_models/summary_view_model.dart';

import '../../../testing/orders.dart';

Future<void> _settle() => Future<void>.delayed(Duration.zero);

void main() {
  test('trae las cifras de la tienda activa', () async {
    final (auth, orders) = await signedInWithOrders();
    final vm = SummaryViewModel(auth: auth, orders: orders);
    await _settle();

    final dashboard = vm.dashboard;
    expect(vm.firstName, 'Valentina');
    expect(dashboard?.pendingOrders, 4);
    expect(dashboard?.stalePendingOrders, 1);
    // Los cancelados no cuentan como venta.
    expect(dashboard?.monthOrders, 24);
    expect(dashboard?.lowStock, isNotEmpty);
  });

  test('confirmar un pedido baja los pendientes', () async {
    final (auth, orders) = await signedInWithOrders();
    final vm = SummaryViewModel(auth: auth, orders: orders);
    await _settle();

    await orders.updateStatus('lino-1026', OrderStatus.confirmed);
    await _settle();

    expect(vm.dashboard?.pendingOrders, 3);
  });

  test('al cambiar de tienda vuelve a pedir las cifras', () async {
    final (auth, orders) = await signedInWithOrders();
    final vm = SummaryViewModel(auth: auth, orders: orders);
    await _settle();
    final lino = vm.dashboard?.monthRevenue;

    await auth.selectStore('s-brisa');
    await _settle();

    expect(vm.activeStore?.name, 'Brisa Caribe');
    expect(vm.dashboard?.monthRevenue, isNot(lino));
    expect(vm.dashboard?.pendingRestock, 0);
  });
}
