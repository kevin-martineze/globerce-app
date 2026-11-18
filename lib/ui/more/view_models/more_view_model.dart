import 'package:flutter/foundation.dart';

import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/domain/models/session.dart';
import 'package:globerce_app/ui/more/more_links.dart';
import 'package:globerce_app/utils/command.dart';
import 'package:globerce_app/utils/result.dart';

/// La pestaña "Más": la tienda activa, las secciones que no tienen pestaña y
/// cerrar sesión.
class MoreViewModel extends ChangeNotifier {
  MoreViewModel({required this._auth, this._links = moreLinks}) {
    logout = Command0<void>(_logout);
    _auth.addListener(notifyListeners);
  }

  final AuthRepository _auth;
  final List<MoreLink> _links;

  late final Command0<void> logout;

  Store? get activeStore => _auth.session?.activeStore;

  bool get canSwitchStore => (_auth.session?.stores.length ?? 0) > 1;

  /// Las secciones de [group] que le tocan al rol de la tienda activa.
  List<MoreLink> linksFor(MoreGroup group) {
    final isOwner = activeStore?.role == StoreRole.owner;
    return [
      for (final link in _links)
        if (link.group == group && (!link.ownerOnly || isOwner)) link,
    ];
  }

  Future<Result<void>> _logout() async {
    await _auth.logout();
    return const Result.ok(null);
  }

  @override
  void dispose() {
    _auth.removeListener(notifyListeners);
    logout.dispose();
    super.dispose();
  }
}
