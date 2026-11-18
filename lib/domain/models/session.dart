import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';

/// Rol de la cuenta dentro de una tienda.
enum StoreRole {
  /// La dueña: puede todo.
  owner,

  /// Alguien de su equipo.
  staff,
}

/// La persona que inició sesión.
@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String email,
    String? fullName,
  }) = _User;
}

/// Una tienda donde la cuenta es miembro.
@freezed
abstract class Store with _$Store {
  const factory Store({
    required String id,
    required String name,
    required String slug,
    required StoreRole role,
  }) = _Store;
}

/// La sesión abierta, sin los tokens.
///
/// Los tokens no salen de la capa de datos: la UI no los necesita y así no hay
/// forma de que terminen pintados o en un log.
@freezed
abstract class Session with _$Session {
  const Session._();

  const factory Session({
    required User user,
    required List<Store> stores,

    /// Tienda a la que está atado el token. Null si la cuenta no es miembro de
    /// ninguna tienda.
    String? activeStoreId,
  }) = _Session;

  Store? get activeStore {
    for (final store in stores) {
      if (store.id == activeStoreId) return store;
    }
    return null;
  }
}
