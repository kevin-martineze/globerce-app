import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/atoms/g_logo.dart';
import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';

/// Las pantallas de acceso de Globerce: isotipo, antetítulo, título, contenido
/// y pie. La pantalla solo pone el título y el formulario.
///
/// Es el `AuthTemplate.svelte` de shopping-sas llevado al teléfono:
/// - Hace scroll, así que con el teclado abierto o el texto grande de
///   accesibilidad nada queda tapado.
/// - El contenido se centra en vertical cuando cabe, y en una tablet no pasa
///   de [MaxWidth.narrow].
/// - Tocar fuera de un campo cierra el teclado.
class AuthTemplate extends StatelessWidget {
  const AuthTemplate({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.child,
    this.logoLabel,
    this.footer,
  });

  final String eyebrow;
  final String title;
  final Widget child;

  /// Texto accesible del isotipo.
  final String? logoLabel;

  /// Lo que va al final: enlaces a la web, por ejemplo.
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.background,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.symmetric(
                  horizontal: Space.gutter,
                  vertical: Space.xl,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - Space.xl * 2,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: MaxWidth.narrow,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(child: GLogo(semanticLabel: logoLabel)),
                          const SizedBox(height: Space.lg),
                          Text(
                            eyebrow,
                            textAlign: TextAlign.center,
                            style: textTheme.labelSmall?.copyWith(
                              color: colors.mutedForeground,
                            ),
                          ),
                          const SizedBox(height: Space.sm),
                          Semantics(
                            header: true,
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: textTheme.headlineMedium,
                            ),
                          ),
                          const SizedBox(height: Space.xxl),
                          child,
                          if (footer != null) ...[
                            const SizedBox(height: Space.xxl),
                            Center(child: footer),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
