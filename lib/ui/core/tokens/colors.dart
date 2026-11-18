import 'package:flutter/material.dart';

/// Colores de Globerce, los mismos de `.marketing-light` y `.marketing-dark`
/// en `shopping-sas/src/app.css`.
///
/// Es el único archivo donde se escribe un `Color(0xFF…)`. El resto de la app
/// los lee con `context.colors`.
///
/// Reglas que vienen del kit de marca:
/// - El teal es el único color que pide toque. Los antetítulos no van en teal
///   aunque quedaría bonito: parecerían enlaces.
/// - Sobre pizarra el Teal Globin se hunde, así que en oscuro lo que se pulsa
///   va en Teal Claro.
@immutable
class GloberceColors extends ThemeExtension<GloberceColors> {
  const GloberceColors({
    required this.background,
    required this.foreground,
    required this.card,
    required this.cardForeground,
    required this.primary,
    required this.primaryForeground,
    required this.muted,
    required this.mutedForeground,
    required this.border,
    required this.input,
    required this.ring,
    required this.destructive,
    required this.success,
    required this.caution,
  });

  final Color background;
  final Color foreground;
  final Color card;
  final Color cardForeground;

  /// La acción: lo único que pide toque.
  final Color primary;
  final Color primaryForeground;

  /// Superficies secundarias (el lino).
  final Color muted;

  /// Texto secundario: antetítulos, ayudas, pies.
  final Color mutedForeground;

  final Color border;

  /// Borde de los campos de texto.
  final Color input;

  /// Anillo de foco.
  final Color ring;

  final Color destructive;
  final Color success;

  /// Terracota: queda poco, alguien espera.
  final Color caution;

  static const light = GloberceColors(
    background: Color(0xFFFFFFFF),
    foreground: Color(0xFF0E1A1C), // Pizarra
    card: Color(0xFFFFFFFF),
    cardForeground: Color(0xFF0E1A1C),
    primary: Color(0xFF1E6F6B), // Teal Globin
    primaryForeground: Color(0xFFFFFFFF),
    muted: Color(0xFFF1EEE7), // Lino
    mutedForeground: Color(0xFF4A5251), // Grafito
    border: Color(0xFFE4E0D7), // Borde Lino
    input: Color(0xFFE4E0D7),
    ring: Color(0xFF48A79C), // Teal Claro
    // PENDIENTE: confirmar contra el kit de marca. Sale del `--destructive`
    // del panel, oklch(0.58 0.21 27).
    destructive: Color(0xFFC9372C),
    success: Color(0xFF1E6F6B),
    caution: Color(0xFFC0662F), // Terracota
  );

  static const dark = GloberceColors(
    background: Color(0xFF0E1A1C), // Pizarra
    foreground: Color(0xFFF6F4EF), // Lino, como texto
    card: Color(0xFF1A2628),
    cardForeground: Color(0xFFF6F4EF),
    primary: Color(0xFF48A79C), // Teal Claro
    primaryForeground: Color(0xFF0E1A1C),
    muted: Color(0xFF1A2628),
    // Un escalón más claro que el #7A8280 del kit: sobre pizarra daba 3.9:1 y
    // el mínimo legible es 4.5:1.
    mutedForeground: Color(0xFF96A09E),
    border: Color(0x17FFFFFF), // blanco 9 %
    input: Color(0x1FFFFFFF), // blanco 12 %
    ring: Color(0xFF7FBDB4),
    destructive: Color(0xFFE06C5A),
    success: Color(0xFF48A79C),
    caution: Color(0xFFC0662F),
  );

  @override
  GloberceColors copyWith({
    Color? background,
    Color? foreground,
    Color? card,
    Color? cardForeground,
    Color? primary,
    Color? primaryForeground,
    Color? muted,
    Color? mutedForeground,
    Color? border,
    Color? input,
    Color? ring,
    Color? destructive,
    Color? success,
    Color? caution,
  }) {
    return GloberceColors(
      background: background ?? this.background,
      foreground: foreground ?? this.foreground,
      card: card ?? this.card,
      cardForeground: cardForeground ?? this.cardForeground,
      primary: primary ?? this.primary,
      primaryForeground: primaryForeground ?? this.primaryForeground,
      muted: muted ?? this.muted,
      mutedForeground: mutedForeground ?? this.mutedForeground,
      border: border ?? this.border,
      input: input ?? this.input,
      ring: ring ?? this.ring,
      destructive: destructive ?? this.destructive,
      success: success ?? this.success,
      caution: caution ?? this.caution,
    );
  }

  @override
  GloberceColors lerp(GloberceColors? other, double t) {
    if (other == null) return this;

    Color mix(Color a, Color b) => Color.lerp(a, b, t) ?? a;

    return GloberceColors(
      background: mix(background, other.background),
      foreground: mix(foreground, other.foreground),
      card: mix(card, other.card),
      cardForeground: mix(cardForeground, other.cardForeground),
      primary: mix(primary, other.primary),
      primaryForeground: mix(primaryForeground, other.primaryForeground),
      muted: mix(muted, other.muted),
      mutedForeground: mix(mutedForeground, other.mutedForeground),
      border: mix(border, other.border),
      input: mix(input, other.input),
      ring: mix(ring, other.ring),
      destructive: mix(destructive, other.destructive),
      success: mix(success, other.success),
      caution: mix(caution, other.caution),
    );
  }
}

extension GloberceColorsContext on BuildContext {
  /// Los colores de Globerce del tema activo (claro u oscuro).
  GloberceColors get colors =>
      Theme.of(this).extension<GloberceColors>() ?? GloberceColors.light;
}
