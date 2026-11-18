import 'package:flutter/foundation.dart';

import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/data/repositories/orders/orders_repository.dart';
import 'package:globerce_app/domain/models/order.dart';
import 'package:globerce_app/domain/models/session.dart';
import 'package:globerce_app/utils/command.dart';
import 'package:globerce_app/utils/result.dart';

/// El resumen del panel: el saludo y las cifras de la tienda activa.
class SummaryViewModel extends ChangeNotifier {
  SummaryViewModel({required this._auth, required this._orders}) {
    load = Command0(_load)..execute();
    // Si se cambia de tienda desde "Más", el saludo se entera.
    _auth.addListener(notifyListeners);
    // Si cambia un pedido o la tienda, las cifras se vuelven a pedir.
    _orders.addListener(_reload);
  }

  final AuthRepository _auth;
  final OrdersRepository _orders;

  late final Command0<Dashboard> load;

  Dashboard? _dashboard;

  /// Las cifras, o null mientras cargan la primera vez.
  Dashboard? get dashboard => _dashboard;

  /// El nombre de pila, o null si la cuenta no tiene nombre.
  String? get firstName {
    final fullName = _auth.session?.user.fullName?.trim();
    if (fullName == null || fullName.isEmpty) return null;
    return fullName.split(RegExp(r'\s+')).first;
  }

  Store? get activeStore => _auth.session?.activeStore;

  /// Para "arrastra para recargar".
  Future<void> refresh() => load.execute();

  Future<Result<Dashboard>> _load() async {
    final result = await _orders.dashboard();
    if (result case Ok(value: final dashboard)) _dashboard = dashboard;
    return result;
  }

  void _reload() => load.execute();

  @override
  void dispose() {
    _auth.removeListener(notifyListeners);
    _orders.removeListener(_reload);
    load.dispose();
    super.dispose();
  }
}
