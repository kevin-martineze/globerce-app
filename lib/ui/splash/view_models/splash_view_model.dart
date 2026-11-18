import 'package:flutter/foundation.dart';

import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/utils/command.dart';

/// Restaura la sesión guardada al abrir la app.
///
/// Si sale bien, el repositorio cambia de estado y el router se va al login o
/// al inicio. Si no hay conexión, la pantalla ofrece reintentar.
class SplashViewModel extends ChangeNotifier {
  SplashViewModel({required AuthRepository auth})
    : restore = Command0<void>(auth.restore) {
    restore.execute();
  }

  final Command0<void> restore;

  @override
  void dispose() {
    restore.dispose();
    super.dispose();
  }
}
