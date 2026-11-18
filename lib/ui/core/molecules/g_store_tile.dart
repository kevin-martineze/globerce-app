import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Una tienda: inicial, nombre y rol. En el selector y en "Más".
class GStoreTile extends StatelessWidget {
  const GStoreTile({
    super.key,
    required this.name,
    required this.role,
    required this.onTap,
    this.active = false,
    this.loading = false,
    this.showChevron = true,
  });

  final String name;

  /// El rol ya traducido: "Dueña", "Equipo".
  final String role;
  final VoidCallback? onTap;

  /// Es la tienda activa de la sesión: se marca con el borde teal.
  final bool active;
  final bool loading;

  /// La flecha del final. Sin ella, la ficha solo informa.
  final bool showChevron;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;
    final initial = name.isEmpty ? '?' : name.characters.first.toUpperCase();

    return Semantics(
      button: true,
      selected: active,
      child: Material(
        color: colors.card,
        shape: RoundedRectangleBorder(
          borderRadius: Radii.card,
          side: BorderSide(
            color: active ? colors.primary : colors.border,
            width: active ? 2 : 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(Space.lg),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colors.muted,
                    borderRadius: Radii.field,
                  ),
                  child: Text(initial, style: textTheme.titleMedium),
                ),
                const SizedBox(width: Space.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: textTheme.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        role,
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.mutedForeground,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: Space.sm),
                if (loading)
                  SizedBox.square(
                    dimension: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colors.primary,
                    ),
                  )
                else if (showChevron)
                  Icon(
                    LucideIcons.chevronRight,
                    size: 20,
                    color: colors.mutedForeground,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
