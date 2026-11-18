import 'package:flutter/foundation.dart';

import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/domain/models/order.dart';
import 'package:globerce_app/utils/result.dart';

/// Los pedidos de la tienda activa y las cifras del resumen.
///
/// Es un `ChangeNotifier` que avisa cuando lo que mostró ya no vale: cuando
/// se cambia un pedido o cuando cambia la tienda activa. Las pantallas que lo
/// escuchan vuelven a cargar; ninguna tiene que avisarle a otra.
abstract class OrdersRepository extends ChangeNotifier {
  OrdersRepository({required AuthRepository auth}) : _auth = auth {
    _lastStoreId = auth.session?.activeStoreId;
    auth.addListener(_onAuthChanged);
  }

  final AuthRepository _auth;
  String? _lastStoreId;

  /// La tienda activa, o null si no hay sesión.
  @protected
  String? get storeId => _auth.session?.activeStoreId;

  Future<Result<Dashboard>> dashboard();

  /// Una página de pedidos, los más nuevos primero.
  ///
  /// [query] busca por número (con o sin `#`) o por parte del nombre.
  Future<Result<OrderPage>> list({
    OrderStatus? status,
    String? query,
    int page = 1,
  });

  Future<Result<OrderDetail>> detail(String orderId);

  /// Cancelar devuelve el stock y el cupón. Un pedido cancelado no se puede
  /// reabrir: la API responde `409`.
  Future<Result<OrderDetail>> updateStatus(String orderId, OrderStatus status);

  /// Guarda la nota interna. Vacía, la borra.
  Future<Result<OrderDetail>> updateNotes(String orderId, String notes);

  void _onAuthChanged() {
    final current = storeId;
    if (current == _lastStoreId) return;
    _lastStoreId = current;
    notifyListeners();
  }

  @override
  void dispose() {
    _auth.removeListener(_onAuthChanged);
    super.dispose();
  }
}

/// Códigos de error propios de los pedidos.
abstract final class OrdersErrorCode {
  /// Se intentó reabrir un pedido cancelado (`ConflictException` en la API).
  static const conflict = 'Conflict';
}
