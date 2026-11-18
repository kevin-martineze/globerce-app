import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';

/// Una cifra del resumen: qué es, cuánto y una línea de contexto.
///
/// Con [attention] la línea de contexto va en terracota: hay algo esperando.
class GStatTile extends StatelessWidget {
  const GStatTile({
    super.key,
    required this.label,
    required this.value,
    this.hint,
    this.attention = false,
    this.onTap,
  });

  final String label;
  final String value;
  final String? hint;
  final bool attention;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;
    final hint = this.hint;

    return Semantics(
      button: onTap != null,
      child: Material(
        color: colors.muted,
        borderRadius: Radii.card,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(Space.lg + Space.xs),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colors.mutedForeground,
                  ),
                ),
                const SizedBox(height: Space.sm),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(value, style: textTheme.headlineSmall),
                ),
                if (hint != null) ...[
                  const SizedBox(height: Space.xs),
                  Text(
                    hint,
                    style: textTheme.bodySmall?.copyWith(
                      color: attention
                          ? colors.caution
                          : colors.mutedForeground,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
