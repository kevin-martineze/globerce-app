import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/data/repositories/orders/orders_repository.dart';
import 'package:globerce_app/domain/models/order.dart';
import 'package:globerce_app/utils/result.dart';

/// Los pedidos en memoria, sin API.
///
/// Cada tienda de las cuentas demo tiene sus pedidos, con ropa y precios de
/// verdad. Sigue las mismas reglas que la API: 20 por página, los más nuevos
/// primero, y un pedido cancelado no se reabre.
class OrdersRepositoryFake extends OrdersRepository {
  OrdersRepositoryFake({
    required super.auth,
    this.latency = const Duration(milliseconds: 500),
    DateTime Function()? now,
    Map<String, List<OrderDetail>>? orders,
  }) : _now = now ?? DateTime.now,
       _orders = orders ?? demoOrders((now ?? DateTime.now)());

  /// Espera antes de responder, para ver el estado de carga.
  final Duration latency;
  final DateTime Function() _now;

  /// Pedidos por tienda, los más nuevos primero.
  final Map<String, List<OrderDetail>> _orders;

  static const pageSize = 20;

  @override
  Future<Result<Dashboard>> dashboard() async {
    await _wait();
    final orders = _storeOrders;
    if (orders == null) return const Result.error(_noSession);

    final now = _now();
    final monthStart = DateTime(now.year, now.month);
    final pending = orders
        .map((detail) => detail.order)
        .where((order) => order.status == OrderStatus.pending);
    final month = orders
        .map((detail) => detail.order)
        .where(
          (order) =>
              order.status != OrderStatus.cancelled &&
              !order.createdAt.isBefore(monthStart),
        );

    return Result.ok(
      Dashboard(
        pendingOrders: pending.length,
        stalePendingOrders: pending
            .where(
              (order) =>
                  now.difference(order.createdAt) > const Duration(hours: 24),
            )
            .length,
        monthRevenue: month.fold(0, (sum, order) => sum + order.total),
        monthOrders: month.length,
        lowStock: _lowStock[storeId] ?? const [],
        pendingRestock: storeId == 's-lino' ? 3 : 0,
      ),
    );
  }

  @override
  Future<Result<OrderPage>> list({
    OrderStatus? status,
    String? query,
    int page = 1,
  }) async {
    await _wait();
    final orders = _storeOrders;
    if (orders == null) return const Result.error(_noSession);

    final term = query?.trim().toLowerCase().replaceFirst('#', '') ?? '';
    final matching = [
      for (final detail in orders)
        if ((status == null || detail.order.status == status) &&
            (term.isEmpty ||
                detail.order.number.toString() == term ||
                detail.order.customerName.toLowerCase().contains(term)))
          detail.order,
    ];

    final pageCount = (matching.length / pageSize).ceil();
    return Result.ok(
      OrderPage(
        orders: matching.skip((page - 1) * pageSize).take(pageSize).toList(),
        total: matching.length,
        page: page,
        pageCount: pageCount < 1 ? 1 : pageCount,
      ),
    );
  }

  @override
  Future<Result<OrderDetail>> detail(String orderId) async {
    await _wait();
    final orders = _storeOrders;
    if (orders == null) return const Result.error(_noSession);

    for (final detail in orders) {
      if (detail.order.id == orderId) return Result.ok(detail);
    }
    return const Result.error(_notFound);
  }

  @override
  Future<Result<OrderDetail>> updateStatus(
    String orderId,
    OrderStatus status,
  ) async {
    final current = await detail(orderId);
    if (current case Ok(value: final detail)
        when detail.order.status == OrderStatus.cancelled &&
            status != OrderStatus.cancelled) {
      return const Result.error(_cannotReopen);
    }

    return _replace(
      current,
      (detail) => detail.copyWith(order: detail.order.copyWith(status: status)),
    );
  }

  @override
  Future<Result<OrderDetail>> updateNotes(String orderId, String notes) async {
    final trimmed = notes.trim();
    return _replace(
      await detail(orderId),
      (detail) => detail.copyWith(
        order: detail.order.copyWith(
          adminNotes: trimmed.isEmpty ? null : trimmed,
        ),
      ),
    );
  }

  Result<OrderDetail> _replace(
    Result<OrderDetail> current,
    OrderDetail Function(OrderDetail detail) change,
  ) {
    final orders = _storeOrders;
    if (current case Ok(value: final detail) when orders != null) {
      final updated = change(detail);
      final index = orders.indexWhere((o) => o.order.id == detail.order.id);
      orders[index] = updated;
      notifyListeners();
      return Result.ok(updated);
    }
    return current;
  }

  List<OrderDetail>? get _storeOrders {
    final id = storeId;
    if (id == null) return null;
    return _orders.putIfAbsent(id, () => []);
  }

  Future<void> _wait() async {
    if (latency > Duration.zero) await Future<void>.delayed(latency);
  }

  static const _noSession = AppError(
    code: AuthErrorCode.noSession,
    message: 'Tu sesión se cerró. Vuelve a entrar.',
  );

  static const _notFound = AppError(
    code: 'Not Found',
    message: 'Pedido no encontrado.',
    statusCode: 404,
  );

  static const _cannotReopen = AppError(
    code: OrdersErrorCode.conflict,
    message:
        'Un pedido cancelado no se puede reabrir: su stock ya volvió al '
        'inventario.',
    statusCode: 409,
  );

  static const _lowStock = {
    's-lino': [
      LowStockItem(
        variantId: 'v-camisa-blanco-s',
        productName: 'Camisa de lino manga larga',
        variantLabel: 'Blanco · S',
        stock: 1,
      ),
      LowStockItem(
        variantId: 'v-palazzo-arena-m',
        productName: 'Pantalón palazzo de lino',
        variantLabel: 'Arena · M',
        stock: 2,
      ),
      LowStockItem(
        variantId: 'v-vestido-terracota-l',
        productName: 'Vestido midi de algodón',
        variantLabel: 'Terracota · L',
        stock: 0,
      ),
    ],
    's-brisa': [
      LowStockItem(
        variantId: 'v-bikini-negro-s',
        productName: 'Bikini tiro alto',
        variantLabel: 'Negro · S',
        stock: 2,
      ),
    ],
  };
}

/// Los pedidos de las tiendas demo, relativos a [now].
///
/// Lino & Algodón tiene 26 pedidos (dos páginas) y Brisa Caribe 8.
Map<String, List<OrderDetail>> demoOrders(DateTime now) {
  return {
    's-lino': _generate(
      prefix: 'lino',
      firstNumber: 1001,
      count: 26,
      products: _linoProducts,
      now: now,
    ),
    's-brisa': _generate(
      prefix: 'brisa',
      firstNumber: 201,
      count: 8,
      products: _brisaProducts,
      now: now,
    ),
  };
}

typedef _Product = ({String name, String variant, String sku, int price});

const _linoProducts = <_Product>[
  (
    name: 'Camisa de lino manga larga',
    variant: 'Blanco · M',
    sku: 'CL-BL-M',
    price: 159000,
  ),
  (
    name: 'Pantalón palazzo de lino',
    variant: 'Arena · S',
    sku: 'PP-AR-S',
    price: 189000,
  ),
  (
    name: 'Vestido midi de algodón',
    variant: 'Terracota · M',
    sku: 'VM-TE-M',
    price: 219000,
  ),
  (
    name: 'Blusa guayabera',
    variant: 'Crudo · L',
    sku: 'BG-CR-L',
    price: 139000,
  ),
  (name: 'Short de lino', variant: 'Oliva · M', sku: 'SL-OL-M', price: 119000),
  (name: 'Kimono de algodón', variant: '', sku: 'KA-EST', price: 169000),
];

const _brisaProducts = <_Product>[
  (
    name: 'Vestido de baño entero',
    variant: 'Coral · M',
    sku: 'VB-CO-M',
    price: 189000,
  ),
  (
    name: 'Bikini tiro alto',
    variant: 'Negro · S',
    sku: 'BT-NE-S',
    price: 159000,
  ),
  (name: 'Salida de baño', variant: 'Blanco', sku: 'SB-BL', price: 129000),
];

const _customers = [
  'Camila Torres',
  'Daniela Gómez',
  'María José Pérez',
  'Laura Restrepo',
  'Andrea Martínez',
  'Sofía Herrera',
  'Valeria Castro',
  'Juliana Ospina',
  'Natalia Vargas',
  'Carolina Díaz',
  'Paula Rincón',
  'Isabella Moreno',
];

const _cities = [
  'Barranquilla',
  'Bogotá',
  'Medellín',
  'Cali',
  'Cartagena',
  'Santa Marta',
];

/// El estado de cada pedido según su antigüedad: los más nuevos esperan
/// respuesta y los viejos ya se entregaron.
OrderStatus _statusFor(int index) {
  if (index < 4) return OrderStatus.pending;
  if (index == 5 || index == 17) return OrderStatus.cancelled;
  if (index < 8) return OrderStatus.confirmed;
  if (index < 12) return OrderStatus.shipped;
  return OrderStatus.delivered;
}

List<OrderDetail> _generate({
  required String prefix,
  required int firstNumber,
  required int count,
  required List<_Product> products,
  required DateTime now,
}) {
  return [
    for (var i = 0; i < count; i++)
      _order(
        prefix: prefix,
        number: firstNumber + count - 1 - i,
        index: i,
        products: products,
        // El pendiente número 3 lleva más de un día esperando.
        createdAt: now.subtract(Duration(hours: i == 3 ? 30 : 1 + i * 9)),
      ),
  ];
}

OrderDetail _order({
  required String prefix,
  required int number,
  required int index,
  required List<_Product> products,
  required DateTime createdAt,
}) {
  final status = _statusFor(index);
  final city = _cities[index % _cities.length];
  final local = city == 'Barranquilla';

  final lines = [
    for (var line = 0; line < 1 + index % 3; line++)
      (product: products[(index + line * 2) % products.length], qty: 1 + line),
  ];
  final items = [
    for (final (i, line) in lines.indexed)
      OrderItem(
        id: '$prefix-$number-$i',
        productName: line.product.name,
        variantLabel: line.product.variant,
        sku: line.product.sku,
        unitPrice: line.product.price,
        qty: line.qty,
        lineTotal: line.product.price * line.qty,
      ),
  ];

  final subtotal = items.fold(0, (sum, item) => sum + item.lineTotal);
  final coupon = index % 7 == 2 ? 'BIENVENIDA' : null;
  final discount = coupon == null ? 0 : subtotal ~/ 10;
  final shippingCost = local ? 8000 : 15000;
  final paidOnline = index % 2 == 0;

  return OrderDetail(
    order: Order(
      id: '$prefix-$number',
      number: number,
      status: status,
      paymentStatus: switch (status) {
        OrderStatus.cancelled => PaymentStatus.unpaid,
        _ when paidOnline => PaymentStatus.paid,
        _ => PaymentStatus.unpaid,
      },
      customerName: _customers[index % _customers.length],
      customerPhone: '+57 300 555 ${(1200 + index * 37).toString()}',
      customerCity: city,
      customerAddress: 'Calle ${40 + index} # ${10 + index}-${20 + index}',
      customerNotes: index % 4 == 1 ? 'Es para regalo, ¿la envuelven?' : null,
      shippingZoneName: local ? 'Barranquilla' : 'Nacional',
      shippingCost: shippingCost,
      couponCode: coupon,
      subtotal: subtotal,
      discount: discount,
      total: subtotal - discount + shippingCost,
      whatsappOpenedAt: index.isEven ? createdAt : null,
      adminNotes: index == 6
          ? 'Confirmó por chat que paga contra entrega.'
          : null,
      createdAt: createdAt,
    ),
    items: items,
  );
}
