import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/atoms/g_text_field.dart';
import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Campo de contraseña con el ojo para mostrarla u ocultarla.
///
/// Se puede ver lo que se escribe porque en el teléfono equivocarse con una
/// letra es fácil y no hay forma de notarlo con los puntos.
class GPasswordField extends StatefulWidget {
  const GPasswordField({
    super.key,
    required this.showLabel,
    required this.hideLabel,
    this.controller,
    this.focusNode,
    this.errorText,
    this.enabled = true,
    this.textInputAction,
    this.autofillHints = const [AutofillHints.password],
    this.onChanged,
    this.onSubmitted,
  });

  /// Texto accesible del botón del ojo: "Mostrar contraseña".
  final String showLabel;

  /// "Ocultar contraseña".
  final String hideLabel;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? errorText;
  final bool enabled;
  final TextInputAction? textInputAction;
  final Iterable<String> autofillHints;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  State<GPasswordField> createState() => _GPasswordFieldState();
}

class _GPasswordFieldState extends State<GPasswordField> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return GTextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      errorText: widget.errorText,
      enabled: widget.enabled,
      obscureText: !_visible,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: widget.textInputAction,
      autofillHints: widget.autofillHints,
      autocorrect: false,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      suffix: IconButton(
        tooltip: _visible ? widget.hideLabel : widget.showLabel,
        onPressed: widget.enabled
            ? () => setState(() => _visible = !_visible)
            : null,
        icon: Icon(
          _visible ? LucideIcons.eyeOff : LucideIcons.eye,
          size: 20,
          color: context.colors.mutedForeground,
        ),
      ),
    );
  }
}
