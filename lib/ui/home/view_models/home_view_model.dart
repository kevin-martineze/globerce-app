import 'package:flutter/foundation.dart';

import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/domain/models/session.dart';
import 'package:globerce_app/utils/command.dart';
import 'package:globerce_app/utils/result.dart';

/// El inicio del panel. Por ahora solo saluda, muestra la tienda activa y
/// deja cambiar de tienda o salir: el panel de verdad llega en la fase 2.
class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required this._auth}) {
    logout = Command0<void>(_logout);
  }

  final AuthRepository _auth;

  late final Command0<void> logout;

  /// El nombre de pila, o null si la cuenta no tiene nombre.
  String? get firstName {
    final fullName = _auth.session?.user.fullName?.trim();
    if (fullName == null || fullName.isEmpty) return null;
    return fullName.split(RegExp(r'\s+')).first;
  }

  Store? get activeStore => _auth.session?.activeStore;

  bool get canSwitchStore => (_auth.session?.stores.length ?? 0) > 1;

  Future<Result<void>> _logout() async {
    await _auth.logout();
    return const Result.ok(null);
  }

  @override
  void dispose() {
    logout.dispose();
    super.dispose();
  }
}
