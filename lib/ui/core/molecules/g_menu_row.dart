import 'package:flutter/material.dart';
import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Una fila de menú: icono, texto y, al final, la flecha o el aviso de que
/// se abre fuera de la app.
class GMenuRow extends StatelessWidget {
  const GMenuRow({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.external = false,
    this.externalHint,
    this.destructive = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  /// Se abre en el navegador: lleva el icono de enlace externo.
  final bool external;

  /// Texto accesible para [external]: "Se abre en la web".
  final String? externalHint;

  /// Acciones como cerrar sesión: el texto va en el color de peligro.
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final color = destructive ? colors.destructive : colors.foreground;

    return Semantics(
      button: true,
      hint: external ? externalHint : null,
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
                Icon(icon, size: 20, color: color),
                const SizedBox(width: Space.md),
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.bodyLarge
                        ?.copyWith(color: color),
                  ),
                ),
                if (!destructive)
                  Icon(
                    external
                        ? LucideIcons.externalLink
                        : LucideIcons.chevronRight,
                    size: 18,
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

/// Un grupo de filas con título, sobre una tarjeta con borde.
class GMenuGroup extends StatelessWidget {
  const GMenuGroup({super.key, required this.children, this.title});

  final String? title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final title = this.title;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(left: Space.xs, bottom: Space.sm),
            child: Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall
                  ?.copyWith(color: colors.mutedForeground),
            ),
          ),
        Material(
          color: colors.card,
          shape: RoundedRectangleBorder(
            borderRadius: Radii.card,
            side: BorderSide(color: colors.border),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              for (var i = 0; i < children.length; i++) ...[
                if (i > 0)
                  Divider(
                    height: 1,
                    indent: Space.lg + 20 + Space.md,
                    color: colors.border,
                  ),
                children[i],
              ],
            ],
          ),
        ),
      ],
    );
  }
}
