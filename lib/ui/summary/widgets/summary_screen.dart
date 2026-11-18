import 'package:flutter/material.dart';
import 'package:globerce_app/config/env.dart';
import 'package:globerce_app/domain/models/order.dart';
import 'package:globerce_app/routing/routes.dart';
import 'package:globerce_app/ui/core/atoms/g_badge.dart';
import 'package:globerce_app/ui/core/atoms/g_button.dart';
import 'package:globerce_app/ui/core/atoms/g_logo.dart';
import 'package:globerce_app/ui/core/l10n/generated/app_localizations.dart';
import 'package:globerce_app/ui/core/molecules/g_inline_message.dart';
import 'package:globerce_app/ui/core/molecules/g_menu_row.dart';
import 'package:globerce_app/ui/core/molecules/g_stat_tile.dart';
import 'package:globerce_app/ui/core/templates/panel_page_template.dart';
import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';
import 'package:globerce_app/ui/core/utils/format.dart';
import 'package:globerce_app/ui/core/utils/open_link.dart';
import 'package:globerce_app/ui/summary/view_models/summary_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// La primera pestaña del panel: el saludo y cómo va la tienda.
class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key, required this.viewModel});

  final SummaryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListenableBuilder(
      listenable: Listenable.merge([viewModel, viewModel.load]),
      builder: (context, _) {
        final firstName = viewModel.firstName;
        final store = viewModel.activeStore;
        final dashboard = viewModel.dashboard;
        final error = viewModel.load.error;

        return PanelPageTemplate(
          onRefresh: viewModel.refresh,
          leading: Align(
            alignment: Alignment.centerLeft,
            child: GLogo(size: 36, semanticLabel: l10n.brandMarkLabel),
          ),
          title: firstName == null
              ? l10n.homeGreetingNoName
              : l10n.homeGreeting(firstName),
          subtitle: store == null ? null : l10n.homeActiveStore(store.name),
          children: [
            if (dashboard != null)
              ..._figures(context, dashboard)
            else if (error != null) ...[
              GInlineMessage(message: l10n.summaryLoadFailed),
              const SizedBox(height: Space.lg),
              GButton(
                label: l10n.retry,
                variant: GButtonVariant.outline,
                onPressed: viewModel.load.execute,
              ),
            ] else
              const _Loading(),
          ],
        );
      },
    );
  }

  List<Widget> _figures(BuildContext context, Dashboard dashboard) {
    final l10n = AppLocalizations.of(context);
    final stale = dashboard.stalePendingOrders;

    return [
      IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: GStatTile(
                label: l10n.summaryPendingLabel,
                value: '${dashboard.pendingOrders}',
                hint: dashboard.pendingOrders == 0
                    ? l10n.summaryPendingNone
                    : stale > 0
                    ? l10n.summaryPendingStale(stale)
                    : l10n.summaryPendingFresh,
                attention: stale > 0,
                onTap: () => context.go(Routes.orders),
              ),
            ),
            const SizedBox(width: Space.md),
            Expanded(
              child: GStatTile(
                label: l10n.summaryMonthLabel,
                value: formatMoney(dashboard.monthRevenue),
                hint: l10n.summaryMonthOrders(dashboard.monthOrders),
              ),
            ),
          ],
        ),
      ),
      if (dashboard.lowStock.isNotEmpty) ...[
        const SizedBox(height: Space.xl),
        GMenuGroup(
          title: l10n.summaryLowStockTitle,
          children: [
            for (final item in dashboard.lowStock)
              _LowStockRow(key: ValueKey(item.variantId), item: item),
          ],
        ),
      ],
      if (dashboard.pendingRestock > 0) ...[
        const SizedBox(height: Space.xl),
        GMenuGroup(
          children: [
            GMenuRow(
              icon: LucideIcons.bellRing,
              label: l10n.summaryRestock(dashboard.pendingRestock),
              external: true,
              externalHint: l10n.opensOnWeb,
              onTap: () => openExternalLink(
                context,
                '${Env.webBaseUrl}/admin/restock-alerts',
                failureMessage: l10n.errorOpenLink,
              ),
            ),
          ],
        ),
      ],
    ];
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Space.xxxl),
      child: Center(
        child: CircularProgressIndicator(color: context.colors.primary),
      ),
    );
  }
}

/// Una variante que se está quedando sin existencias.
class _LowStockRow extends StatelessWidget {
  const _LowStockRow({super.key, required this.item});

  final LowStockItem item;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Space.lg,
        vertical: Space.md,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.productName, style: textTheme.bodyLarge),
                if (item.variantLabel.isNotEmpty)
                  Text(
                    item.variantLabel,
                    style: textTheme.bodySmall?.copyWith(
                      color: colors.mutedForeground,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: Space.md),
          GBadge(
            label: l10n.summaryStockLeft(item.stock),
            tone: item.stock == 0 ? GBadgeTone.destructive : GBadgeTone.caution,
          ),
        ],
      ),
    );
  }
}
