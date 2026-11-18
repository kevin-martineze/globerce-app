import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/atoms/g_button.dart';
import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';

/// Pide confirmación antes de algo sin vuelta atrás, en una hoja que sube
/// desde abajo, al alcance del pulgar.
///
/// Devuelve true solo si se tocó [confirmLabel]. Cerrar la hoja de cualquier
/// otra forma cuenta como no.
Future<bool> showConfirmSheet(
  BuildContext context, {
  required String title,
  required String body,
  required String confirmLabel,
  required String cancelLabel,
  bool destructive = false,
}) async {
  final colors = context.colors;

  final confirmed = await showModalBottomSheet<bool>(
    context: context,
    // Por encima de la barra inferior del panel, que también se oscurece.
    useRootNavigator: true,
    backgroundColor: colors.background,
    showDragHandle: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      final textTheme = Theme.of(context).textTheme;

      return Padding(
        padding: const EdgeInsets.fromLTRB(
          Space.gutter,
          0,
          Space.gutter,
          Space.xl,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              header: true,
              child: Text(title, style: textTheme.titleLarge),
            ),
            const SizedBox(height: Space.sm),
            Text(
              body,
              style: textTheme.bodyMedium?.copyWith(
                color: colors.mutedForeground,
              ),
            ),
            const SizedBox(height: Space.xl),
            GButton(
              label: confirmLabel,
              variant: destructive
                  ? GButtonVariant.destructive
                  : GButtonVariant.primary,
              onPressed: () => Navigator.of(context).pop(true),
            ),
            const SizedBox(height: Space.sm),
            GButton(
              label: cancelLabel,
              variant: GButtonVariant.outline,
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
        ),
      );
    },
  );

  return confirmed ?? false;
}
