import 'package:flutter/foundation.dart';

import 'package:globerce_app/utils/result.dart';

typedef CommandAction0<T> = Future<Result<T>> Function();
typedef CommandAction1<T, A> = Future<Result<T>> Function(A argument);

/// Una acción asíncrona de la UI con su estado.
///
/// La View escucha el comando: mientras [running] deshabilita el botón, si hay
/// [error] lo muestra y cuando [completed] sigue adelante. Un comando que ya
/// está corriendo ignora una segunda ejecución: es lo que evita el doble envío.
abstract class Command<T> extends ChangeNotifier {
  bool _running = false;
  Result<T>? _result;

  bool get running => _running;

  /// El último resultado, o null si nunca corrió o se limpió.
  Result<T>? get result => _result;

  bool get completed => _result is Ok<T>;

  /// El error del último intento, si lo hubo.
  AppError? get error => switch (_result) {
    Error<T>(:final error) => error,
    _ => null,
  };

  /// Olvida el último resultado, por ejemplo cuando la usuaria vuelve a
  /// escribir y el mensaje de error ya no aplica.
  void clearResult() {
    if (_result == null) return;
    _result = null;
    notifyListeners();
  }

  Future<void> _execute(CommandAction0<T> action) async {
    if (_running) return;

    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

/// Comando sin argumentos.
final class Command0<T> extends Command<T> {
  Command0(this._action);

  final CommandAction0<T> _action;

  Future<void> execute() => _execute(_action);
}

/// Comando con un argumento.
final class Command1<T, A> extends Command<T> {
  Command1(this._action);

  final CommandAction1<T, A> _action;

  Future<void> execute(A argument) => _execute(() => _action(argument));
}
