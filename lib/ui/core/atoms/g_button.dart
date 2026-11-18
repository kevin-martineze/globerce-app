import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';

enum GButtonVariant {
  /// Teal: la acción principal de la pantalla.
  primary,

  /// Sin fondo, con borde: acciones secundarias.
  outline,

  /// Para lo que no tiene vuelta atrás, como cancelar un pedido.
  destructive,
}

/// El botón de Globerce: píldora y peso 600.
///
/// Con [loading] el botón se deshabilita y muestra un indicador junto al
/// texto, que la pantalla cambia por el de "enviando" ("Entrando…"). Así se
/// cumple la regla de no dejar enviar dos veces.
class GButton extends StatelessWidget {
  const GButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = GButtonVariant.primary,
    this.loading = false,
    this.expand = true,
    this.icon,
  });

  final String label;

  /// Null deshabilita el botón.
  final VoidCallback? onPressed;
  final GButtonVariant variant;
  final bool loading;

  /// Ocupa todo el ancho disponible.
  final bool expand;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final enabled = onPressed != null && !loading;

    final (background, foreground, side) = switch (variant) {
      GButtonVariant.primary => (
        colors.primary,
        colors.primaryForeground,
        BorderSide.none,
      ),
      GButtonVariant.outline => (
        Colors.transparent,
        colors.foreground,
        BorderSide(color: colors.input),
      ),
      GButtonVariant.destructive => (
        colors.destructive,
        colors.primaryForeground,
        BorderSide.none,
      ),
    };

    final textStyle = Theme.of(context).textTheme.labelLarge
        ?.copyWith(color: foreground);

    final content = Row(
      mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (loading) ...[
          SizedBox.square(
            dimension: 16,
            child: CircularProgressIndicator(strokeWidth: 2, color: foreground),
          ),
          const SizedBox(width: Space.sm),
        ] else if (icon != null) ...[
          Icon(icon, size: 18, color: foreground),
          const SizedBox(width: Space.sm),
        ],
        Flexible(
          child: Text(label, style: textStyle, overflow: TextOverflow.ellipsis),
        ),
      ],
    );

    return Semantics(
      button: true,
      enabled: enabled,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 150),
        // Mientras carga se ve vivo: el indicador ya dice que está ocupado.
        opacity: enabled || loading ? 1 : 0.5,
        child: Material(
          color: background,
          shape: StadiumBorder(side: side),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: enabled ? onPressed : null,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 52),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Space.xl,
                  vertical: Space.md,
                ),
                child: content,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
