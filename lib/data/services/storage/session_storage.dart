import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Dónde vive el refresh token entre aperturas de la app.
abstract interface class SessionStorage {
  Future<String?> readRefreshToken();

  Future<void> writeRefreshToken(String token);

  Future<void> deleteRefreshToken();

  /// Borra lo que haya quedado de una instalación anterior.
  Future<void> clearIfFreshInstall();
}

/// El refresh token en Keychain (iOS) o Keystore (Android).
///
/// Dura 30 días, así que nunca va a `SharedPreferences`, que en Android es un
/// XML legible para quien tenga acceso al sistema de archivos.
class SecureSessionStorage implements SessionStorage {
  SecureSessionStorage({
    FlutterSecureStorage? secure,
    SharedPreferencesAsync? prefs,
  }) : _secure = secure ?? const FlutterSecureStorage(),
       _prefs = prefs ?? SharedPreferencesAsync();

  final FlutterSecureStorage _secure;
  final SharedPreferencesAsync _prefs;

  static const _refreshTokenKey = 'globerce.refresh_token';
  static const _installedKey = 'globerce.installed';

  @override
  Future<String?> readRefreshToken() => _secure.read(key: _refreshTokenKey);

  @override
  Future<void> writeRefreshToken(String token) =>
      _secure.write(key: _refreshTokenKey, value: token);

  @override
  Future<void> deleteRefreshToken() => _secure.delete(key: _refreshTokenKey);

  /// En iOS el Keychain sobrevive a desinstalar la app. Sin esto, quien
  /// reinstala entra con la sesión de antes, que puede ser de otra persona si
  /// el teléfono cambió de manos. `SharedPreferences` sí se borra al
  /// desinstalar, así que su ausencia dice que es una instalación nueva.
  @override
  Future<void> clearIfFreshInstall() async {
    final installed = await _prefs.getBool(_installedKey) ?? false;
    if (installed) return;

    await _secure.delete(key: _refreshTokenKey);
    await _prefs.setBool(_installedKey, true);
  }
}
