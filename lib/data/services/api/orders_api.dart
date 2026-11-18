import 'package:globerce_app/data/services/api/api_call.dart';
import 'package:globerce_app/data/services/api/api_client.dart';
import 'package:globerce_app/data/services/api/models/order_dto.dart';
import 'package:globerce_app/utils/result.dart';

/// Las rutas de pedidos y del resumen del panel
/// (`ecommerce-api/src/modules/orders/controllers/orders.controller.ts`).
///
/// Todas van bajo `/stores/:storeId`, y la API comprueba que el token esté
/// atado a esa tienda.
class OrdersApi {
  OrdersApi(this._client);

  final ApiClient _client;

  Future<Result<DashboardDto>> dashboard(String storeId) {
    return apiCall(
      () => _client.dio.get<Object?>('/stores/$storeId/dashboard'),
      DashboardDto.fromJson,
    );
  }

  /// [status] va en mayúsculas, como lo espera la API (`PENDING`).
  Future<Result<OrderPageDto>> list(
    String storeId, {
    String? status,
    String? query,
    int page = 1,
  }) {
    return apiCall(
      () => _client.dio.get<Object?>(
        '/stores/$storeId/orders',
        queryParameters: {
          'status': ?status,
          'q': ?query,
          if (page > 1) 'page': page,
        },
      ),
      OrderPageDto.fromJson,
    );
  }

  Future<Result<OrderDto>> detail(String storeId, String orderId) {
    return apiCall(
      () => _client.dio.get<Object?>('/stores/$storeId/orders/$orderId'),
      OrderDto.fromJson,
    );
  }

  /// Cambia el estado o la nota interna. Lo que no se manda no cambia; una
  /// nota vacía la borra (la API la guarda como null).
  Future<Result<OrderDto>> update(
    String storeId,
    String orderId, {
    String? status,
    String? adminNotes,
  }) {
    return apiCall(
      () => _client.dio.patch<Object?>(
        '/stores/$storeId/orders/$orderId',
        data: {'status': ?status, 'adminNotes': ?adminNotes},
      ),
      OrderDto.fromJson,
    );
  }
}
