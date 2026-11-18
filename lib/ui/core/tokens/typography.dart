import 'package:flutter/material.dart';

/// Tipografía de Globerce: Inter Tight, una sola familia. El peso hace de
/// titular, igual que en el sitio comercial.
///
/// La fuente es variable. Flutter no elige el peso de una fuente variable con
/// `fontWeight` solo: hace falta además la variación `wght`. Por eso todos los
/// estilos salen de [_style].
abstract final class GloberceTypography {
  static const family = 'InterTight';

  /// Peso de interfaz del kit: botones, etiquetas, títulos.
  static const semibold = FontWeight.w600;

  static TextStyle _style(
    double size,
    FontWeight weight, {
    double? height,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: family,
      fontSize: size,
      fontWeight: weight,
      fontVariations: [FontVariation.weight(weight.value.toDouble())],
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextTheme textTheme(Color color) {
    final theme = TextTheme(
      displaySmall: _style(
        36,
        FontWeight.w700,
        height: 1.1,
        letterSpacing: -0.8,
      ),
      headlineMedium: _style(
        30,
        FontWeight.w700,
        height: 1.15,
        letterSpacing: -0.6,
      ),
      headlineSmall: _style(
        24,
        FontWeight.w700,
        height: 1.2,
        letterSpacing: -0.4,
      ),
      titleLarge: _style(20, semibold, height: 1.25, letterSpacing: -0.2),
      titleMedium: _style(16, semibold, height: 1.35),
      titleSmall: _style(14, semibold, height: 1.35),
      bodyLarge: _style(16, FontWeight.w400, height: 1.5),
      bodyMedium: _style(14, FontWeight.w400, height: 1.5),
      bodySmall: _style(13, FontWeight.w400, height: 1.45),
      labelLarge: _style(15, semibold, height: 1.2),
      labelMedium: _style(14, FontWeight.w500, height: 1.3),
      // Antetítulo: versalitas espaciadas, gris.
      labelSmall: _style(12, semibold, height: 1.3, letterSpacing: 1.4),
    );

    return theme.apply(bodyColor: color, displayColor: color);
  }
}
