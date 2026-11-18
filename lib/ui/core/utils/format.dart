import 'package:intl/intl.dart';

final _money = NumberFormat.decimalPattern('es_CO');

/// Un precio en pesos, sin decimales: `$18.000`.
String formatMoney(int pesos) {
  final sign = pesos < 0 ? '-' : '';
  return '$sign\$${_money.format(pesos.abs())}';
}

/// El enlace para escribirle por WhatsApp a [phone] con [message] escrito.
///
/// wa.me solo acepta dígitos y con el indicativo del país. Un celular
/// colombiano de 10 dígitos (`300 123 4567`) llega sin indicativo y se le
/// pone el 57.
Uri whatsAppUri(String phone, String message) {
  var digits = phone.replaceAll(RegExp(r'\D'), '');
  if (digits.length == 10 && digits.startsWith('3')) digits = '57$digits';
  return Uri.https('wa.me', '/$digits', {'text': message});
}
