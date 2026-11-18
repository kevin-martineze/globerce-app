import 'package:flutter/foundation.dart';

import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/domain/models/session.dart';
import 'package:globerce_app/utils/command.dart';
import 'package:globerce_app/utils/result.dart';

/// Por qué un campo no pasa. La pantalla lo convierte en texto.
enum LoginFieldError { required, invalid }

typedef Credentials = ({String email, String password});

/// El estado de la pantalla de login.
///
/// Solo se valida lo mínimo: que el correo tenga forma de correo y que haya
/// contraseña. Las reglas de la contraseña no se validan al entrar, igual que
/// en la API: decirlas aquí le diría a un atacante cuáles son, y dejaría fuera
/// a cuentas creadas con reglas más viejas.
///
/// Los errores de campo aparecen después del primer intento de enviar, no
/// mientras la persona todavía está escribiendo.
class LoginViewModel extends ChangeNotifier {
  LoginViewModel({required this._auth}) {
    login = Command1<Session, Credentials>(_login);
  }

  final AuthRepository _auth;

  /// Entra con [Credentials]. Al terminar bien, el router redirige solo.
  late final Command1<Session, Credentials> login;

  String _email = '';
  String _password = '';
  bool _submitted = false;

  LoginFieldError? get emailError => _submitted ? _validateEmail(_email) : null;

  LoginFieldError? get passwordError =>
      _submitted ? _validatePassword(_password) : null;

  void setEmail(String value) {
    if (value == _email) return;
    _email = value;
    login.clearResult();
    notifyListeners();
  }

  void setPassword(String value) {
    if (value == _password) return;
    _password = value;
    login.clearResult();
    notifyListeners();
  }

  /// Valida y, si todo está bien, envía.
  Future<void> submit() async {
    _submitted = true;
    notifyListeners();

    if (emailError != null || passwordError != null) return;

    await login.execute((email: _email.trim(), password: _password));
  }

  Future<Result<Session>> _login(Credentials credentials) {
    return _auth.login(
      email: credentials.email,
      password: credentials.password,
    );
  }

  static final _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  static LoginFieldError? _validateEmail(String value) {
    final email = value.trim();
    if (email.isEmpty) return LoginFieldError.required;
    if (!_emailPattern.hasMatch(email)) return LoginFieldError.invalid;
    return null;
  }

  static LoginFieldError? _validatePassword(String value) {
    return value.isEmpty ? LoginFieldError.required : null;
  }

  @override
  void dispose() {
    login.dispose();
    super.dispose();
  }
}
