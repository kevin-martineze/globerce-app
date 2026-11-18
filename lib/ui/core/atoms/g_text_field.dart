import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/tokens/colors.dart';

/// El campo de texto de Globerce.
///
/// Los bordes, el relleno y el foco salen del `inputDecorationTheme` de
/// `AppTheme`. La validación no vive aquí: el ViewModel decide y la pantalla
/// pasa el texto en [errorText].
class GTextField extends StatelessWidget {
  const GTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.errorText,
    this.enabled = true,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.autocorrect = true,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onSubmitted,
    this.suffix,
    this.prefixIcon,
    this.minLines,
    this.maxLines = 1,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? errorText;
  final bool enabled;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final bool autocorrect;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  /// Lo que va al final del campo, por ejemplo el ojo de la contraseña.
  final Widget? suffix;

  /// Icono al inicio del campo, por ejemplo la lupa del buscador.
  final IconData? prefixIcon;

  /// Para textos largos, como una nota: [minLines] filas visibles y crece
  /// hasta [maxLines]. Null en [maxLines] no pone tope.
  final int? minLines;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return TextField(
      controller: controller,
      focusNode: focusNode,
      enabled: enabled,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofillHints: enabled ? autofillHints : null,
      autocorrect: autocorrect,
      enableSuggestions: !obscureText && autocorrect,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      minLines: minLines,
      maxLines: obscureText ? 1 : maxLines,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: enabled ? colors.foreground : colors.mutedForeground,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText,
        errorMaxLines: 3,
        suffixIcon: suffix,
        prefixIcon: prefixIcon == null
            ? null
            : Icon(prefixIcon, size: 18, color: colors.mutedForeground),
      ),
    );
  }
}
