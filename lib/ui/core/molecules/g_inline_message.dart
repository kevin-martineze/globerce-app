import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

enum GInlineMessageTone { error, success }

/// Mensaje debajo de un formulario: un error de la API o una confirmación.
///
/// Se anuncia a los lectores de pantalla en cuanto aparece (`liveRegion`), para
/// que quien no ve la pantalla sepa por qué no avanzó.
class GInlineMessage extends StatelessWidget {
  const GInlineMessage({
    super.key,
    required this.message,
    this.tone = GInlineMessageTone.error,
  });

  final String message;
  final GInlineMessageTone tone;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final (color, icon) = switch (tone) {
      GInlineMessageTone.error => (colors.destructive, LucideIcons.circleAlert),
      GInlineMessageTone.success => (colors.success, LucideIcons.circleCheck),
    };

    return Semantics(
      liveRegion: true,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(icon, size: 16, color: color),
          ),
          const SizedBox(width: Space.sm),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium
                  ?.copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}
