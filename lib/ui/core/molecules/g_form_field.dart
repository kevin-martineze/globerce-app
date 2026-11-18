import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';

/// Etiqueta, acción opcional y campo.
///
/// La etiqueta va fuera del campo, como en la web, y a la derecha puede ir una
/// acción ("¿La olvidaste?"). Para los lectores de pantalla, la etiqueta y el
/// campo se leen juntos.
class GFormField extends StatelessWidget {
  const GFormField({
    super.key,
    required this.label,
    required this.child,
    this.action,
  });

  final String label;
  final Widget child;

  /// Lo que va a la derecha de la etiqueta.
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.labelMedium
        ?.copyWith(color: context.colors.foreground);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: Space.sm),
                child: Text(label, style: labelStyle),
              ),
            ),
            if (action != null)
              Padding(padding: const EdgeInsets.only(bottom: 2), child: action),
          ],
        ),
        Semantics(label: label, child: child),
      ],
    );
  }
}
