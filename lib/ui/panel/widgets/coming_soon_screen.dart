import 'package:flutter/material.dart';
import 'package:globerce_app/config/env.dart';
import 'package:globerce_app/ui/core/atoms/g_button.dart';
import 'package:globerce_app/ui/core/l10n/generated/app_localizations.dart';
import 'package:globerce_app/ui/core/molecules/g_empty_state.dart';
import 'package:globerce_app/ui/core/templates/panel_page_template.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';
import 'package:globerce_app/ui/core/utils/open_link.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Una pestaña que todavía no tiene pantalla nativa: dice qué va a haber y
/// ofrece la misma sección en el panel web.
///
/// No tiene ViewModel porque no tiene estado: cuando la sección exista de
/// verdad, la reemplaza su propia pantalla con su ViewModel.
class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({
    super.key,
    required this.title,
    required this.icon,
    required this.emptyTitle,
    required this.emptyBody,
    required this.webPath,
  });

  final String title;
  final IconData icon;
  final String emptyTitle;
  final String emptyBody;

  /// La sección equivalente en el panel web: `/admin/orders`.
  final String webPath;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return PanelPageTemplate(
      title: title,
      children: [
        GEmptyState(icon: icon, title: emptyTitle, body: emptyBody),
        const SizedBox(height: Space.xl),
        GButton(
          label: l10n.openOnWeb,
          variant: GButtonVariant.outline,
          icon: LucideIcons.externalLink,
          onPressed: () => openExternalLink(
            context,
            '${Env.webBaseUrl}$webPath',
            failureMessage: l10n.errorOpenLink,
          ),
        ),
      ],
    );
  }
}
