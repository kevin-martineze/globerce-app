import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:globerce_app/utils/command.dart';
import 'package:globerce_app/utils/result.dart';

void main() {
  test('ignora una segunda ejecución mientras corre', () async {
    var calls = 0;
    final gate = Completer<Result<int>>();
    final command = Command0<int>(() {
      calls++;
      return gate.future;
    });

    final first = command.execute();
    final second = command.execute();
    expect(command.running, isTrue);

    gate.complete(const Result.ok(1));
    await Future.wait([first, second]);

    expect(calls, 1);
    expect(command.running, isFalse);
    expect(command.completed, isTrue);
  });

  test('expone el error y lo limpia', () async {
    final command = Command1<void, String>(
      (_) async => const Result.error(AppError(code: 'x', message: 'Falló')),
    );

    await command.execute('a');
    expect(command.error?.message, 'Falló');
    expect(command.completed, isFalse);

    command.clearResult();
    expect(command.error, isNull);
  });
}
