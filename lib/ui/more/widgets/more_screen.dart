import 'package:flutter/material.dart';
import 'package:globerce_app/config/env.dart';
import 'package:globerce_app/domain/models/session.dart';
import 'package:globerce_app/routing/routes.dart';
import 'package:globerce_app/ui/core/l10n/generated/app_localizations.dart';
import 'package:globerce_app/ui/core/molecules/g_menu_row.dart';
import 'package:globerce_app/ui/core/molecules/g_store_tile.dart';
import 'package:globerce_app/ui/core/templates/panel_page_template.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';
import 'package:globerce_app/ui/core/utils/open_link.dart';
import 'package:globerce_app/ui/more/more_links.dart';
import 'package:globerce_app/ui/more/view_models/more_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// La pestaña "Más": la tienda activa, las demás secciones del panel y
/// cerrar sesión.
class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key, required this.viewModel});

  final MoreViewModel viewModel;

  String _label(MoreLinkId id, AppLocalizations l10n) {
    return switch (id) {
      MoreLinkId.collections => l10n.linkCollections,
      MoreLinkId.design => l10n.linkDesign,
      MoreLinkId.catalogs => l10n.linkCatalogs,
      MoreLinkId.coupons => l10n.linkCoupons,
      MoreLinkId.shipping => l10n.linkShipping,
      MoreLinkId.domain => l10n.linkDomain,
      MoreLinkId.restockAlerts => l10n.linkRestockAlerts,
      MoreLinkId.support => l10n.linkSupport,
      MoreLinkId.settings => l10n.linkSettings,
      MoreLinkId.team => l10n.linkTeam,
      MoreLinkId.payments => l10n.linkPayments,
      MoreLinkId.plan => l10n.linkPlan,
      MoreLinkId.account => l10n.linkAccount,
    };
  }

  Widget _group(BuildContext context, MoreGroup group, String title) {
    final l10n = AppLocalizations.of(context);

    return GMenuGroup(
      title: title,
      children: [
        for (final link in viewModel.linksFor(group))
          GMenuRow(
            key: ValueKey(link.id),
            icon: link.icon,
            label: _label(link.id, l10n),
            external: true,
            externalHint: l10n.opensOnWeb,
            onTap: () => openExternalLink(
              context,
              '${Env.webBaseUrl}${link.webPath}',
              failureMessage: l10n.errorOpenLink,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListenableBuilder(
      listenable: Listenable.merge([viewModel, viewModel.logout]),
      builder: (context, _) {
        final store = viewModel.activeStore;

        return PanelPageTemplate(
          title: l10n.navMore,
          children: [
            if (store != null)
              GStoreTile(
                name: store.name,
                role: store.role == StoreRole.owner
                    ? l10n.roleOwner
                    : l10n.roleStaff,
                // Con una sola tienda no hay a dónde cambiar: la ficha solo informa.
                onTap: viewModel.canSwitchStore
                    ? () => context.go(Routes.stores)
                    : null,
                showChevron: viewModel.canSwitchStore,
              ),
            const SizedBox(height: Space.xl),
            _group(context, MoreGroup.store, l10n.moreGroupStore),
            const SizedBox(height: Space.xl),
            _group(context, MoreGroup.account, l10n.moreGroupAccount),
            const SizedBox(height: Space.xl),
            GMenuGroup(
              children: [
                GMenuRow(
                  icon: LucideIcons.logOut,
                  label: viewModel.logout.running
                      ? l10n.loggingOut
                      : l10n.logout,
                  destructive: true,
                  onTap: viewModel.logout.running
                      ? null
                      : viewModel.logout.execute,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
