import 'package:flutter/foundation.dart';

import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/domain/models/session.dart';
import 'package:globerce_app/utils/command.dart';
import 'package:globerce_app/utils/result.dart';

/// Elegir con cuál tienda trabajar, cuando la cuenta tiene varias.
class StorePickerViewModel extends ChangeNotifier {
  StorePickerViewModel({required this._auth}) {
    select = Command1<Session, String>(_select);
    logout = Command0<void>(_logout);
  }

  final AuthRepository _auth;

  late final Command1<Session, String> select;
  late final Command0<void> logout;

  String? _pendingStoreId;

  List<Store> get stores => _auth.session?.stores ?? const [];

  String? get activeStoreId => _auth.session?.activeStoreId;

  /// La tienda que se está activando, para pintar su indicador.
  String? get pendingStoreId => select.running ? _pendingStoreId : null;

  Future<Result<Session>> _select(String storeId) {
    _pendingStoreId = storeId;
    return _auth.selectStore(storeId);
  }

  Future<Result<void>> _logout() async {
    await _auth.logout();
    return const Result.ok(null);
  }

  @override
  void dispose() {
    select.dispose();
    logout.dispose();
    super.dispose();
  }
}
