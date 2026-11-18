import 'package:flutter/foundation.dart';

import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/data/repositories/orders/orders_repository.dart';
import 'package:globerce_app/domain/models/order.dart';
import 'package:globerce_app/utils/command.dart';
import 'package:globerce_app/utils/result.dart';

/// Un pedido: sus líneas, la clienta, el estado y la nota interna.
class OrderDetailViewModel extends ChangeNotifier {
  OrderDetailViewModel({
    required this.orderId,
    required this._orders,
    required this._auth,
  }) {
    load = Command0(_load)..execute();
    changeStatus = Command1(_changeStatus);
    saveNotes = Command1(_saveNotes);
  }

  final String orderId;
  final OrdersRepository _orders;
  final AuthRepository _auth;

  late final Command0<OrderDetail> load;
  late final Command1<OrderDetail, OrderStatus> changeStatus;
  late final Command1<OrderDetail, String> saveNotes;

  OrderDetail? _detail;

  /// El pedido, o null mientras carga la primera vez.
  OrderDetail? get detail => _detail;

  /// El nombre de la tienda activa, para el saludo de WhatsApp.
  String? get storeName => _auth.session?.activeStore?.name;

  /// Un pedido cancelado ya devolvió su stock: la API no deja reabrirlo, así
  /// que la pantalla tampoco lo ofrece.
  bool get isCancelled => _detail?.order.status == OrderStatus.cancelled;

  /// Se puede pasar a [status] desde el estado actual.
  bool canChangeTo(OrderStatus status) {
    final current = _detail?.order.status;
    return current != null &&
        current != status &&
        current != OrderStatus.cancelled &&
        !changeStatus.running;
  }

  /// Para "arrastra para recargar".
  Future<void> refresh() => load.execute();

  Future<Result<OrderDetail>> _load() => _keep(_orders.detail(orderId));

  Future<Result<OrderDetail>> _changeStatus(OrderStatus status) {
    // Un mensaje de "nota guardada" ya no aplica después de otro cambio.
    saveNotes.clearResult();
    return _keep(_orders.updateStatus(orderId, status));
  }

  Future<Result<OrderDetail>> _saveNotes(String notes) {
    changeStatus.clearResult();
    return _keep(_orders.updateNotes(orderId, notes));
  }

  /// Guarda el pedido que devolvió la API: es la versión buena.
  Future<Result<OrderDetail>> _keep(Future<Result<OrderDetail>> request) async {
    final result = await request;
    if (result case Ok(value: final detail)) {
      _detail = detail;
      notifyListeners();
    }
    return result;
  }

  @override
  void dispose() {
    load.dispose();
    changeStatus.dispose();
    saveNotes.dispose();
    super.dispose();
  }
}
