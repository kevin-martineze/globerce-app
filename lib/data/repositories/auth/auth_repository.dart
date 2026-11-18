import 'package:flutter/foundation.dart';

import 'package:globerce_app/domain/models/session.dart';
import 'package:globerce_app/utils/result.dart';

/// En qué punto está la sesión. El router redirige según esto.
enum AuthStatus {
  /// Arrancando: todavía no se sabe si hay una sesión guardada.
  unknown,

  /// Sin sesión: va al login.
  signedOut,

  /// Con sesión y varias tiendas: falta elegir con cuál trabajar.
  choosingStore,

  /// Con sesión y una tienda activa.
  signedIn,
}

/// Códigos de error propios de la autenticación.
abstract final class AuthErrorCode {
  /// La cuenta existe pero no es miembro de ninguna tienda.
  static const noStores = 'no_stores';

  /// Se pidió algo que necesita sesión y no la hay.
  static const noSession = 'no_session';
}

/// La fuente de verdad de la sesión.
///
/// Es un `ChangeNotifier`: `GoRouter` lo escucha como `refreshListenable`, así
/// que cuando la sesión cambia el router redirige solo. Ninguna pantalla
/// navega a mano después de entrar o salir.
abstract class AuthRepository extends ChangeNotifier {
  AuthStatus get status;

  /// La sesión abierta, o null.
  Session? get session;

  /// Restaura la sesión guardada al abrir la app.
  ///
  /// Si no hay conexión devuelve el error y deja el estado en
  /// [AuthStatus.unknown], para que la pantalla de arranque ofrezca
  /// reintentar en vez de mandar al login a alguien que sí tiene sesión.
  Future<Result<void>> restore();

  Future<Result<Session>> login({
    required String email,
    required String password,
  });

  /// Elige la tienda activa. Si es otra, la API emite una sesión nueva atada a
  /// ella.
  Future<Result<Session>> selectStore(String storeId);

  /// Cierra la sesión en este dispositivo. Nunca falla: aunque la API no
  /// responda, la sesión local se borra.
  Future<void> logout();
}
