import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';

/// Un estado vacío: icono, título y una línea que dice qué va a aparecer
/// aquí. Va sobre el lino, como las superficies secundarias de la web.
class GEmptyState extends StatelessWidget {
  const GEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(Space.xl),
      decoration: BoxDecoration(color: colors.muted, borderRadius: Radii.card),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.background,
              borderRadius: Radii.field,
            ),
            child: Icon(icon, size: 22, color: colors.foreground),
          ),
          const SizedBox(height: Space.lg),
          Text(title, style: textTheme.titleMedium),
          const SizedBox(height: Space.xs),
          Text(
            body,
            style: textTheme.bodyMedium?.copyWith(
              color: colors.mutedForeground,
            ),
          ),
        ],
      ),
    );
  }
}
