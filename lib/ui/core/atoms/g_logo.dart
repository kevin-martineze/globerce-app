import 'package:flutter/material.dart';

/// El isotipo de Globerce: la G blanca en relieve abrazando la esfera teal.
///
/// Es un render 3D de 512 px con fondo transparente (el mismo `logo.png` de
/// shopping-sas): el volumen y la luz no caben en un vector. Se pinta siempre
/// más chico para que en pantallas densas se vea nítido.
class GLogo extends StatelessWidget {
  const GLogo({super.key, this.size = 44, this.semanticLabel});

  /// Lado en puntos lógicos.
  final double size;

  /// Texto para lectores de pantalla. Null si va junto al nombre escrito.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/brand/logo.png',
      width: size,
      height: size,
      filterQuality: FilterQuality.medium,
      semanticLabel: semanticLabel,
      excludeFromSemantics: semanticLabel == null,
    );
  }
}
