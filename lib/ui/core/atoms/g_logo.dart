import 'package:flutter/material.dart';

/// El isotipo de Globerce: el hexágono con la G en negativo.
///
/// Es un mapa de bits de 512 px porque así vino la marca (el mismo
/// `logo.png` de shopping-sas). Se pinta siempre más chico para que en
/// pantallas densas se vea nítido.
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
