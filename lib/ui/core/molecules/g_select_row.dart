import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Una opción de una lista de selección única: el texto y, si está elegida,
/// el check. Va dentro de un `GMenuGroup`.
class GSelectRow extends StatelessWidget {
  const GSelectRow({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.destructive = false,
  });

  final String label;
  final bool selected;

  /// Null deshabilita la fila.
  final VoidCallback? onTap;

  /// Una opción sin vuelta atrás, como "Cancelado".
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final enabled = onTap != null || selected;
    final base = destructive ? colors.destructive : colors.foreground;
    final color = enabled ? base : colors.mutedForeground;

    return Semantics(
      button: true,
      selected: selected,
      enabled: onTap != null,
      child: InkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 52),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Space.lg,
              vertical: Space.md,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: color,
                      fontWeight: selected ? FontWeight.w600 : null,
                    ),
                  ),
                ),
                if (selected)
                  Icon(LucideIcons.check, size: 20, color: colors.primary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
