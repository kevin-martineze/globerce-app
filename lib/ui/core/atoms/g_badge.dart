import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';

enum GBadgeTone {
  /// Sobre lino: un dato sin urgencia.
  neutral,

  /// Teal: va bien, está hecho.
  primary,

  /// Terracota: alguien espera una respuesta.
  caution,

  /// Rojo: cancelado o fallido.
  destructive,
}

/// Una etiqueta corta en píldora: el estado de un pedido, de un pago.
class GBadge extends StatelessWidget {
  const GBadge({
    super.key,
    required this.label,
    this.tone = GBadgeTone.neutral,
  });

  final String label;
  final GBadgeTone tone;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final (background, foreground) = switch (tone) {
      GBadgeTone.neutral => (colors.muted, colors.foreground),
      GBadgeTone.primary => (
        colors.primary.withValues(alpha: 0.12),
        colors.primary,
      ),
      GBadgeTone.caution => (
        colors.caution.withValues(alpha: 0.14),
        colors.caution,
      ),
      GBadgeTone.destructive => (
        colors.destructive.withValues(alpha: 0.12),
        colors.destructive,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Space.sm + 2,
        vertical: 3,
      ),
      decoration: BoxDecoration(color: background, borderRadius: Radii.pill),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall
            ?.copyWith(color: foreground, fontWeight: FontWeight.w600),
      ),
    );
  }
}
