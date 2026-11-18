import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// "‹ Pedidos": vuelve a la pantalla anterior. Va encima del título de una
/// pantalla de detalle, en lugar de una barra superior.
class GBackLink extends StatelessWidget {
  const GBackLink({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Align(
      alignment: Alignment.centerLeft,
      child: Semantics(
        button: true,
        child: InkWell(
          onTap: onTap,
          borderRadius: Radii.pill,
          child: ConstrainedBox(
            // 44 pt: lo mínimo cómodo para el dedo.
            constraints: const BoxConstraints(minHeight: 44),
            child: Padding(
              padding: const EdgeInsets.only(right: Space.sm),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    LucideIcons.chevronLeft,
                    size: 20,
                    color: colors.primary,
                  ),
                  const SizedBox(width: Space.xs),
                  Text(
                    label,
                    style: Theme.of(context).textTheme.labelLarge
                        ?.copyWith(color: colors.primary),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
