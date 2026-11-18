import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';

/// Un bloque de una pantalla de detalle: título, una línea opcional que
/// explica y el contenido, sobre una tarjeta con borde. Es el `Card` del panel
/// web.
class GSection extends StatelessWidget {
  const GSection({
    super.key,
    required this.title,
    required this.child,
    this.description,
    this.trailing,
  });

  final String title;
  final String? description;

  /// Lo que va a la derecha del título, por ejemplo "Guardando…".
  final Widget? trailing;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;
    final description = this.description;
    final trailing = this.trailing;

    return Container(
      padding: const EdgeInsets.all(Space.lg + Space.xs),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: Radii.card,
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Semantics(
                  header: true,
                  child: Text(title, style: textTheme.titleMedium),
                ),
              ),
              ?trailing,
            ],
          ),
          if (description != null) ...[
            const SizedBox(height: Space.xs),
            Text(
              description,
              style: textTheme.bodySmall?.copyWith(
                color: colors.mutedForeground,
              ),
            ),
          ],
          const SizedBox(height: Space.lg),
          child,
        ],
      ),
    );
  }
}
