import 'package:flutter/material.dart';
import 'package:globerce_app/domain/models/order.dart';
import 'package:globerce_app/routing/routes.dart';
import 'package:globerce_app/ui/core/atoms/g_button.dart';
import 'package:globerce_app/ui/core/atoms/g_text_field.dart';
import 'package:globerce_app/ui/core/l10n/generated/app_localizations.dart';
import 'package:globerce_app/ui/core/molecules/g_empty_state.dart';
import 'package:globerce_app/ui/core/molecules/g_filter_chips.dart';
import 'package:globerce_app/ui/core/molecules/g_inline_message.dart';
import 'package:globerce_app/ui/core/molecules/g_menu_row.dart';
import 'package:globerce_app/ui/core/templates/panel_page_template.dart';
import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';
import 'package:globerce_app/ui/core/utils/error_text.dart';
import 'package:globerce_app/ui/orders/order_labels.dart';
import 'package:globerce_app/ui/orders/view_models/orders_view_model.dart';
import 'package:globerce_app/ui/orders/widgets/order_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// La pestaña de pedidos.
class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key, required this.viewModel});

  final OrdersViewModel viewModel;

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late final _search = TextEditingController(text: widget.viewModel.query);

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final vm = widget.viewModel;

    return ListenableBuilder(
      listenable: Listenable.merge([vm, vm.load, vm.loadMore]),
      builder: (context, _) {
        final total = vm.total;

        return PanelPageTemplate(
          title: l10n.navOrders,
          subtitle: total == null ? null : l10n.ordersCount(total),
          onRefresh: vm.refresh,
          children: [
            GTextField(
              controller: _search,
              hintText: l10n.ordersSearchHint,
              prefixIcon: LucideIcons.search,
              textInputAction: TextInputAction.search,
              autocorrect: false,
              onSubmitted: vm.search,
              // Al borrar todo vuelve la lista completa, sin tener que enviar.
              onChanged: (text) {
                if (text.isEmpty) vm.search('');
              },
            ),
            const SizedBox(height: Space.md),
            GFilterChips<OrderStatus?>(
              selected: vm.status,
              onSelect: vm.selectStatus,
              options: [
                GFilterOption(value: null, label: l10n.ordersFilterAll),
                for (final status in OrderStatus.values)
                  GFilterOption(value: status, label: status.filterLabel(l10n)),
              ],
            ),
            const SizedBox(height: Space.xl),
            ..._body(context),
          ],
        );
      },
    );
  }

  List<Widget> _body(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final vm = widget.viewModel;
    final error = vm.load.error;
    final orders = vm.orders;

    // Primera carga, o un filtro nuevo todavía sin respuesta.
    if (vm.load.running && (orders.isEmpty || vm.total == null)) {
      return [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Space.xxxl),
          child: Center(
            child: CircularProgressIndicator(color: context.colors.primary),
          ),
        ),
      ];
    }

    if (error != null && orders.isEmpty) {
      return [
        GInlineMessage(
          message: '${l10n.ordersLoadFailed} ${errorText(error, l10n)}',
        ),
        const SizedBox(height: Space.lg),
        GButton(
          label: l10n.retry,
          variant: GButtonVariant.outline,
          onPressed: vm.load.execute,
        ),
      ];
    }

    if (orders.isEmpty) {
      return [
        GEmptyState(
          icon: LucideIcons.receipt,
          title: vm.isFiltered
              ? l10n.ordersEmptyFilteredTitle
              : l10n.ordersEmptyTitle,
          body: vm.isFiltered
              ? l10n.ordersEmptyFilteredBody
              : l10n.ordersEmptyBody,
        ),
      ];
    }

    final loadMoreError = vm.loadMore.error;

    return [
      if (error != null) ...[
        GInlineMessage(message: errorText(error, l10n)),
        const SizedBox(height: Space.lg),
      ],
      // Mientras llega la respuesta de un filtro nuevo, la lista anterior se
      // atenúa en vez de desaparecer.
      AnimatedOpacity(
        duration: const Duration(milliseconds: 150),
        opacity: vm.load.running ? 0.5 : 1,
        child: GMenuGroup(
          children: [
            for (final order in orders)
              OrderTile(
                key: ValueKey(order.id),
                order: order,
                onTap: () => context.go(Routes.order(order.id)),
              ),
          ],
        ),
      ),
      if (vm.hasMore) ...[
        const SizedBox(height: Space.lg),
        if (loadMoreError != null) ...[
          GInlineMessage(message: errorText(loadMoreError, l10n)),
          const SizedBox(height: Space.md),
        ],
        GButton(
          label: l10n.ordersLoadMore,
          variant: GButtonVariant.outline,
          loading: vm.loadMore.running,
          onPressed: vm.loadMore.execute,
        ),
      ],
    ];
  }
}
