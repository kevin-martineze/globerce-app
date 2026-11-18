import 'package:flutter/foundation.dart';

import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/domain/models/session.dart';

/// El resumen del panel. Por ahora saluda y dice en qué tienda estás; las
/// cifras del día llegan cuando exista su endpoint en la app.
class SummaryViewModel extends ChangeNotifier {
  SummaryViewModel({required this._auth}) {
    // Si se cambia de tienda desde "Más", el resumen se entera.
    _auth.addListener(notifyListeners);
  }

  final AuthRepository _auth;

  /// El nombre de pila, o null si la cuenta no tiene nombre.
  String? get firstName {
    final fullName = _auth.session?.user.fullName?.trim();
    if (fullName == null || fullName.isEmpty) return null;
    return fullName.split(RegExp(r'\s+')).first;
  }

  Store? get activeStore => _auth.session?.activeStore;

  @override
  void dispose() {
    _auth.removeListener(notifyListeners);
    super.dispose();
  }
}
