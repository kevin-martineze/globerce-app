import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';
import 'package:globerce_app/ui/core/tokens/typography.dart';

/// El tema de Material alineado con los tokens de Globerce.
///
/// Los átomos leen `context.colors` directamente. Este tema existe para que lo
/// que no se envuelve —el cursor, la selección de texto, los diálogos del
/// sistema— tampoco desentone.
abstract final class AppTheme {
  static ThemeData light() => _build(GloberceColors.light, Brightness.light);

  static ThemeData dark() => _build(GloberceColors.dark, Brightness.dark);

  static ThemeData _build(GloberceColors c, Brightness brightness) {
    final scheme = ColorScheme(
      brightness: brightness,
      primary: c.primary,
      onPrimary: c.primaryForeground,
      secondary: c.primary,
      onSecondary: c.primaryForeground,
      error: c.destructive,
      onError: c.primaryForeground,
      surface: c.background,
      onSurface: c.foreground,
      surfaceContainerHighest: c.muted,
      onSurfaceVariant: c.mutedForeground,
      outline: c.input,
      outlineVariant: c.border,
    );

    final textTheme = GloberceTypography.textTheme(c.foreground);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: c.background,
      fontFamily: GloberceTypography.family,
      textTheme: textTheme,
      extensions: [c],
      splashFactory: InkSparkle.splashFactory,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: c.primary,
        selectionColor: c.primary.withValues(alpha: 0.25),
        selectionHandleColor: c.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.background,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Space.lg,
          vertical: 14,
        ),
        hintStyle: textTheme.bodyLarge?.copyWith(color: c.mutedForeground),
        errorStyle: textTheme.bodySmall?.copyWith(color: c.destructive),
        border: OutlineInputBorder(
          borderRadius: Radii.field,
          borderSide: BorderSide(color: c.input),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: Radii.field,
          borderSide: BorderSide(color: c.input),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: Radii.field,
          borderSide: BorderSide(color: c.ring, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: Radii.field,
          borderSide: BorderSide(color: c.destructive),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: Radii.field,
          borderSide: BorderSide(color: c.destructive, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: Radii.field,
          borderSide: BorderSide(color: c.border),
        ),
      ),
      dividerTheme: DividerThemeData(color: c.border, thickness: 1, space: 1),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: c.primary),
    );
  }
}
