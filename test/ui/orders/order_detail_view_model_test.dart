import 'package:flutter_test/flutter_test.dart';
import 'package:globerce_app/data/repositories/orders/orders_repository.dart';
import 'package:globerce_app/domain/models/order.dart';
import 'package:globerce_app/ui/orders/view_models/order_detail_view_model.dart';
import 'package:globerce_app/utils/result.dart';

import '../../../testing/orders.dart';

Future<void> _settle() => Future<void>.delayed(Duration.zero);

void main() {
  test('carga el pedido con sus líneas y la tienda', () async {
    final (auth, orders) = await signedInWithOrders();
    final vm = OrderDetailViewModel(
      orderId: 'lino-1026',
      orders: orders,
      auth: auth,
    );
    await _settle();

    final detail = vm.detail;
    expect(detail?.order.number, 1026);
    expect(detail?.items, isNotEmpty);
    expect(vm.storeName, 'Lino & Algodón');
  });

  test('un pedido que no existe muestra el error de la API', () async {
    final (auth, orders) = await signedInWithOrders();
    final vm = OrderDetailViewModel(
      orderId: 'nope',
      orders: orders,
      auth: auth,
    );
    await _settle();

    expect(vm.detail, isNull);
    expect(vm.load.error?.statusCode, 404);
  });

  test('cambia el estado y deja el pedido que devolvió la API', () async {
    final (auth, orders) = await signedInWithOrders();
    final vm = OrderDetailViewModel(
      orderId: 'lino-1026',
      orders: orders,
      auth: auth,
    );
    await _settle();
    expect(vm.canChangeTo(OrderStatus.pending), isFalse);
    expect(vm.canChangeTo(OrderStatus.shipped), isTrue);

    await vm.changeStatus.execute(OrderStatus.shipped);

    expect(vm.detail?.order.status, OrderStatus.shipped);
  });

  test('cancelado ya no se puede reabrir', () async {
    final (auth, orders) = await signedInWithOrders();
    final vm = OrderDetailViewModel(
      orderId: 'lino-1026',
      orders: orders,
      auth: auth,
    );
    await _settle();

    await vm.changeStatus.execute(OrderStatus.cancelled);

    expect(vm.isCancelled, isTrue);
    for (final status in OrderStatus.values) {
      expect(vm.canChangeTo(status), isFalse, reason: status.name);
    }

    // Y si algo lo intenta igual, la regla está en los datos, como en la API.
    final reopen = await orders.updateStatus('lino-1026', OrderStatus.pending);
    expect(switch (reopen) {
      Error(:final error) => error.code,
      Ok() => null,
    }, OrdersErrorCode.conflict);
  });

  test('guarda la nota y vacía la borra', () async {
    final (auth, orders) = await signedInWithOrders();
    final vm = OrderDetailViewModel(
      orderId: 'lino-1026',
      orders: orders,
      auth: auth,
    );
    await _settle();

    await vm.saveNotes.execute('  Paga contra entrega  ');
    expect(vm.detail?.order.adminNotes, 'Paga contra entrega');
    expect(vm.saveNotes.completed, isTrue);

    await vm.saveNotes.execute('   ');
    expect(vm.detail?.order.adminNotes, isNull);
  });
}
