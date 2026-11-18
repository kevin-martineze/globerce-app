import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';

/// Una pestaña del panel: título grande, línea opcional debajo y contenido con
/// scroll. La barra inferior la pone el shell, no esta plantilla.
///
/// Es el `PageTemplate` del panel web llevado al teléfono: el título hace de
/// encabezado y no hay barra superior que ocupe espacio.
class PanelPageTemplate extends StatelessWidget {
  const PanelPageTemplate({
    super.key,
    required this.title,
    required this.children,
    this.subtitle,
    this.leading,
    this.onRefresh,
  });

  final String title;
  final String? subtitle;

  /// Lo que va encima del título, por ejemplo el isotipo en el resumen.
  final Widget? leading;
  final List<Widget> children;

  /// Si está, la pantalla se recarga al arrastrar hacia abajo.
  final RefreshCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;
    final subtitle = this.subtitle;
    final onRefresh = this.onRefresh;

    final list = ListView(
      // Siempre se puede arrastrar, aunque el contenido quepa: así funciona
      // el "arrastra para recargar" en una lista corta.
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(
        Space.gutter,
        Space.xl,
        Space.gutter,
        Space.xxl,
      ),
      children: [
        if (leading != null) ...[leading!, const SizedBox(height: Space.xl)],
        Semantics(
          header: true,
          child: Text(title, style: textTheme.headlineMedium),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: Space.xs),
          Text(
            subtitle,
            style: textTheme.bodyLarge?.copyWith(color: colors.mutedForeground),
          ),
        ],
        const SizedBox(height: Space.xl),
        ...children,
      ],
    );

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        bottom: false,
        child: onRefresh == null
            ? list
            : RefreshIndicator(
                onRefresh: onRefresh,
                color: colors.primary,
                child: list,
              ),
      ),
    );
  }
}
