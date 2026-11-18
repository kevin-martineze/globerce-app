import 'package:flutter_test/flutter_test.dart';
import 'package:globerce_app/domain/models/order.dart';
import 'package:globerce_app/ui/orders/view_models/orders_view_model.dart';

import '../../../testing/orders.dart';

/// Deja correr el comando que arrancó el constructor o un filtro.
Future<void> _settle() => Future<void>.delayed(Duration.zero);

void main() {
  test('carga la primera página, los más nuevos primero', () async {
    final (_, orders) = await signedInWithOrders();
    final vm = OrdersViewModel(orders: orders);
    await _settle();

    expect(vm.total, 26);
    expect(vm.orders, hasLength(20));
    expect(vm.orders.first.number, 1026);
    expect(vm.hasMore, isTrue);
  });

  test('"ver más" agrega la página siguiente', () async {
    final (_, orders) = await signedInWithOrders();
    final vm = OrdersViewModel(orders: orders);
    await _settle();

    await vm.loadMore.execute();

    expect(vm.orders, hasLength(26));
    expect(vm.orders.last.number, 1001);
    expect(vm.hasMore, isFalse);
  });

  test('filtra por estado y vuelve a la primera página', () async {
    final (_, orders) = await signedInWithOrders();
    final vm = OrdersViewModel(orders: orders);
    await _settle();

    vm.selectStatus(OrderStatus.pending);
    await _settle();

    expect(vm.total, 4);
    expect(vm.orders.every((o) => o.status == OrderStatus.pending), isTrue);
    expect(vm.isFiltered, isTrue);
  });

  test('busca por número con # y por nombre', () async {
    final (_, orders) = await signedInWithOrders();
    final vm = OrdersViewModel(orders: orders);
    await _settle();

    vm.search('#1020');
    await _settle();
    expect(vm.orders.map((o) => o.number), [1020]);

    vm.search('camila');
    await _settle();
    expect(vm.orders, isNotEmpty);
    expect(vm.orders.every((o) => o.customerName == 'Camila Torres'), isTrue);
  });

  test('el último filtro gana aunque cambie mientras carga', () async {
    final (_, orders) = await signedInWithOrders();
    final vm = OrdersViewModel(orders: orders);

    // Todavía cargando "Todos": se cambia dos veces seguidas.
    vm.selectStatus(OrderStatus.shipped);
    vm.selectStatus(OrderStatus.cancelled);
    await _settle();
    await _settle();

    expect(vm.status, OrderStatus.cancelled);
    expect(vm.orders.every((o) => o.status == OrderStatus.cancelled), isTrue);
    expect(vm.total, 2);
  });

  test('se recarga cuando un pedido cambia en su detalle', () async {
    final (_, orders) = await signedInWithOrders();
    final vm = OrdersViewModel(orders: orders);
    vm.selectStatus(OrderStatus.pending);
    await _settle();
    expect(vm.total, 4);

    await orders.updateStatus('lino-1026', OrderStatus.confirmed);
    await _settle();

    expect(vm.total, 3);
  });
}
