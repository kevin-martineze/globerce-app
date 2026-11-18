import 'package:flutter/widgets.dart';

/// Escala de espacios, en múltiplos de 4.
abstract final class Space {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
  static const xxl = 32.0;
  static const xxxl = 48.0;

  /// Margen lateral de las pantallas.
  static const gutter = 24.0;
}

/// Radios. Las tarjetas van muy redondeadas y los botones en píldora: es lo
/// que separa una portada de producto de una de documento.
abstract final class Radii {
  static const field = BorderRadius.all(Radius.circular(12));
  static const card = BorderRadius.all(Radius.circular(20));
  static const pill = BorderRadius.all(Radius.circular(999));
}

/// Anchos máximos del contenido, para que en una tablet el formulario no se
/// estire de borde a borde.
abstract final class MaxWidth {
  static const narrow = 420.0;
}
