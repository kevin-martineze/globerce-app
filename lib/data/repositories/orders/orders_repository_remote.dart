import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/data/repositories/orders/order_mapping.dart';
import 'package:globerce_app/data/repositories/orders/orders_repository.dart';
import 'package:globerce_app/data/services/api/api_call.dart';
import 'package:globerce_app/data/services/api/models/order_dto.dart';
import 'package:globerce_app/data/services/api/orders_api.dart';
import 'package:globerce_app/domain/models/order.dart';
import 'package:globerce_app/utils/result.dart';

/// Los pedidos desde `ecommerce-api`.
class OrdersRepositoryRemote extends OrdersRepository {
  OrdersRepositoryRemote({required this._api, required super.auth});

  final OrdersApi _api;

  @override
  Future<Result<Dashboard>> dashboard() {
    return _withStore(
      (storeId) async => _map(await _api.dashboard(storeId), (dto) {
        return dto.toDomain();
      }),
    );
  }

  @override
  Future<Result<OrderPage>> list({
    OrderStatus? status,
    String? query,
    int page = 1,
  }) {
    final trimmed = query?.trim();

    return _withStore(
      (storeId) async => _map(
        await _api.list(
          storeId,
          status: status == null ? null : orderStatusToApi(status),
          query: trimmed == null || trimmed.isEmpty ? null : trimmed,
          page: page,
        ),
        (dto) => dto.toDomain(),
      ),
    );
  }

  @override
  Future<Result<OrderDetail>> detail(String orderId) {
    return _withStore(
      (storeId) async =>
          _map(await _api.detail(storeId, orderId), (dto) => dto.toDetail()),
    );
  }

  @override
  Future<Result<OrderDetail>> updateStatus(String orderId, OrderStatus status) {
    return _update(
      (storeId) =>
          _api.update(storeId, orderId, status: orderStatusToApi(status)),
    );
  }

  @override
  Future<Result<OrderDetail>> updateNotes(String orderId, String notes) {
    return _update(
      (storeId) => _api.update(storeId, orderId, adminNotes: notes.trim()),
    );
  }

  /// Cambia un pedido y avisa a quien lo esté mostrando.
  Future<Result<OrderDetail>> _update(
    Future<Result<OrderDto>> Function(String storeId) request,
  ) async {
    final result = await _withStore(
      (storeId) async => _map(await request(storeId), (dto) => dto.toDetail()),
    );
    if (result is Ok<OrderDetail>) notifyListeners();
    return result;
  }

  Future<Result<T>> _withStore<T>(
    Future<Result<T>> Function(String storeId) action,
  ) async {
    final id = storeId;
    if (id == null) {
      return const Result.error(
        AppError(
          code: AuthErrorCode.noSession,
          message: 'Tu sesión se cerró. Vuelve a entrar.',
        ),
      );
    }
    return action(id);
  }

  /// Traduce al dominio. Un valor que la app no conoce (un estado nuevo, por
  /// ejemplo) se vuelve un error claro en vez de una pantalla a medias.
  Result<R> _map<T, R>(Result<T> result, R Function(T value) toDomain) {
    switch (result) {
      case Ok(:final value):
        try {
          return Result.ok(toDomain(value));
        } on FormatException {
          return const Result.error(invalidResponse);
        }
      case Error(:final error):
        return Result.error(error);
    }
  }
}
