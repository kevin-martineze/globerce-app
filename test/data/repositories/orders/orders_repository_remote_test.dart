import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository_fake.dart';
import 'package:globerce_app/data/repositories/orders/orders_repository_remote.dart';
import 'package:globerce_app/data/services/api/api_client.dart';
import 'package:globerce_app/data/services/api/api_error.dart';
import 'package:globerce_app/data/services/api/orders_api.dart';
import 'package:globerce_app/domain/models/order.dart';
import 'package:globerce_app/utils/result.dart';

/// Responde siempre [body] y guarda lo que se pidió.
class _Adapter implements HttpClientAdapter {
  _Adapter(this.body);

  Object body;
  int status = 200;
  final List<RequestOptions> requests = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    return ResponseBody.fromString(
      jsonEncode(body),
      status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

Map<String, Object?> _order({String status = 'PENDING', bool items = false}) {
  return {
    'id': '0b6f',
    'number': 1042,
    'publicToken': 'tok',
    'status': status,
    'paymentStatus': 'PAID',
    'customerName': 'Camila Torres',
    'customerPhone': '3001234567',
    'customerCity': 'Barranquilla',
    'customerAddress': null,
    'customerNotes': null,
    'shippingZoneId': null,
    'shippingZoneName': 'Barranquilla',
    'shippingCost': 8000,
    'couponCode': null,
    'subtotal': 159000,
    'discount': 0,
    'total': 167000,
    'whatsappOpenedAt': null,
    'adminNotes': null,
    'paidAt': '2026-11-17T15:00:00.000Z',
    'createdAt': '2026-11-17T14:30:00.000Z',
    'updatedAt': '2026-11-17T15:00:00.000Z',
    if (items)
      'items': [
        {
          'id': 'it-1',
          'variantId': 'v-1',
          'productId': 'p-1',
          'productName': 'Camisa de lino manga larga',
          'productSlug': 'camisa-lino',
          'variantLabel': 'Blanco · M',
          'sku': 'CL-BL-M',
          'unitPrice': 159000,
          'qty': 1,
          'lineTotal': 159000,
        },
      ],
  };
}

Future<(OrdersRepositoryRemote, _Adapter)> _repository(Object body) async {
  final auth = AuthRepositoryFake(latency: Duration.zero);
  await auth.login(
    email: 'equipo@globerce.test',
    password: AuthRepositoryFake.demoPassword,
  );

  final adapter = _Adapter(body);
  final client = ApiClient(baseUrl: 'http://api.test/v1')
    ..dio.httpClientAdapter = adapter;
  return (OrdersRepositoryRemote(api: OrdersApi(client), auth: auth), adapter);
}

void main() {
  test('lista con el filtro en mayúsculas y la tienda en la ruta', () async {
    final (repo, adapter) = await _repository({
      'orders': [_order()],
      'total': 21,
      'page': 1,
      'pageCount': 2,
      'pageSize': 20,
    });

    final result = await repo.list(status: OrderStatus.pending, query: ' #42 ');

    final request = adapter.requests.single;
    expect(request.path, '/stores/s-lino/orders');
    expect(request.queryParameters, {'status': 'PENDING', 'q': '#42'});

    final page = switch (result) {
      Ok(:final value) => value,
      Error() => null,
    };
    expect(page?.orders.single.status, OrderStatus.pending);
    expect(page?.orders.single.paymentStatus, PaymentStatus.paid);
    expect(page?.hasMore, isTrue);
  });

  test('el detalle trae las líneas', () async {
    final (repo, _) = await _repository(_order(items: true));

    final result = await repo.detail('0b6f');

    final detail = switch (result) {
      Ok(:final value) => value,
      Error() => null,
    };
    expect(detail?.items.single.variantLabel, 'Blanco · M');
    expect(detail?.order.createdAt, DateTime.utc(2026, 11, 17, 14, 30));
  });

  test('cambiar el estado manda PATCH y avisa a quien escucha', () async {
    final (repo, adapter) = await _repository(
      _order(status: 'SHIPPED', items: true),
    );
    var notified = 0;
    repo.addListener(() => notified++);

    final result = await repo.updateStatus('0b6f', OrderStatus.shipped);

    final request = adapter.requests.single;
    expect(request.method, 'PATCH');
    expect(request.path, '/stores/s-lino/orders/0b6f');
    expect(request.data, {'status': 'SHIPPED'});
    expect(result, isA<Ok<OrderDetail>>());
    expect(notified, 1);
  });

  test(
    'un estado desconocido es una respuesta inválida, no un crash',
    () async {
      final (repo, _) = await _repository(_order(status: 'ON_HOLD'));

      final result = await repo.detail('0b6f');

      expect(switch (result) {
        Error(:final error) => error.code,
        Ok() => null,
      }, ApiErrorCode.invalidResponse);
    },
  );

  test('el 409 de la API llega con su mensaje y no avisa', () async {
    final (repo, adapter) = await _repository({
      'statusCode': 409,
      'message': 'Un pedido cancelado no se puede reabrir.',
      'error': 'Conflict',
    });
    adapter.status = 409;
    var notified = 0;
    repo.addListener(() => notified++);

    final result = await repo.updateStatus('0b6f', OrderStatus.pending);

    expect(switch (result) {
      Error(:final error) => error.message,
      Ok() => null,
    }, 'Un pedido cancelado no se puede reabrir.');
    expect(notified, 0);
  });
}
