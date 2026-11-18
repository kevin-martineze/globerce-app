import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/tokens/colors.dart';

/// Texto pulsable y subrayado.
///
/// Va en el color del texto que lo rodea, no en teal: el teal es para la
/// acción principal. El subrayado ya dice que se puede tocar.
class GLink extends StatelessWidget {
  const GLink({
    super.key,
    required this.label,
    required this.onTap,
    this.style,
  });

  final String label;
  final VoidCallback? onTap;

  /// Por defecto, `bodySmall` en el gris secundario.
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final base =
        style ??
        Theme.of(context).textTheme.bodySmall
            ?.copyWith(color: colors.mutedForeground);

    return Semantics(
      link: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: Padding(
          // El área de toque crece sin mover el texto.
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
          child: Text(
            label,
            style: base?.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: base.color,
            ),
          ),
        ),
      ),
    );
  }
}
