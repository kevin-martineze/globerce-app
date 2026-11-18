import 'package:flutter/material.dart';
import 'package:globerce_app/domain/models/order.dart';
import 'package:globerce_app/routing/routes.dart';
import 'package:globerce_app/ui/core/atoms/g_back_link.dart';
import 'package:globerce_app/ui/core/atoms/g_badge.dart';
import 'package:globerce_app/ui/core/atoms/g_button.dart';
import 'package:globerce_app/ui/core/atoms/g_text_field.dart';
import 'package:globerce_app/ui/core/l10n/generated/app_localizations.dart';
import 'package:globerce_app/ui/core/molecules/g_inline_message.dart';
import 'package:globerce_app/ui/core/molecules/g_menu_row.dart';
import 'package:globerce_app/ui/core/molecules/g_section.dart';
import 'package:globerce_app/ui/core/molecules/g_select_row.dart';
import 'package:globerce_app/ui/core/organisms/g_confirm_sheet.dart';
import 'package:globerce_app/ui/core/templates/panel_page_template.dart';
import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';
import 'package:globerce_app/ui/core/utils/error_text.dart';
import 'package:globerce_app/ui/core/utils/format.dart';
import 'package:globerce_app/ui/core/utils/open_link.dart';
import 'package:globerce_app/ui/orders/order_labels.dart';
import 'package:globerce_app/ui/orders/view_models/order_detail_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Un pedido: qué compró, a quién se le manda, en qué va y la nota interna.
class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key, required this.viewModel});

  final OrderDetailViewModel viewModel;

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  final _notes = TextEditingController();

  /// La nota se copia al campo una sola vez: después manda lo que se escribe.
  bool _notesLoaded = false;

  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_loadNotes);
    _loadNotes();
  }

  void _loadNotes() {
    final detail = widget.viewModel.detail;
    if (_notesLoaded || detail == null) return;
    _notesLoaded = true;
    _notes.text = detail.order.adminNotes ?? '';
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_loadNotes);
    _notes.dispose();
    super.dispose();
  }

  Future<void> _selectStatus(OrderStatus status, Order order) async {
    final vm = widget.viewModel;
    if (status == OrderStatus.cancelled) {
      final l10n = AppLocalizations.of(context);
      final confirmed = await showConfirmSheet(
        context,
        title: l10n.orderCancelConfirmTitle('${order.number}'),
        body: l10n.orderCancelConfirmBody,
        confirmLabel: l10n.orderCancelConfirm,
        cancelLabel: l10n.orderCancelKeep,
        destructive: true,
      );
      if (!confirmed) return;
    }
    await vm.changeStatus.execute(status);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final vm = widget.viewModel;

    return ListenableBuilder(
      listenable: Listenable.merge([
        vm,
        vm.load,
        vm.changeStatus,
        vm.saveNotes,
      ]),
      builder: (context, _) {
        final detail = vm.detail;
        final back = GBackLink(
          label: l10n.navOrders,
          onTap: () => context.go(Routes.orders),
        );

        if (detail == null) {
          final error = vm.load.error;
          return PanelPageTemplate(
            leading: back,
            title: l10n.navOrders,
            children: [
              if (error != null) ...[
                GInlineMessage(
                  message: '${l10n.orderLoadFailed} ${errorText(error, l10n)}',
                ),
                const SizedBox(height: Space.lg),
                GButton(
                  label: l10n.retry,
                  variant: GButtonVariant.outline,
                  onPressed: vm.load.execute,
                ),
              ] else
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Space.xxxl),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: context.colors.primary,
                    ),
                  ),
                ),
            ],
          );
        }

        final order = detail.order;
        final locale = Localizations.localeOf(context).toLanguageTag();
        final date = DateFormat(
          "d 'de' MMMM, h:mm a",
          locale,
        ).format(order.createdAt);

        return PanelPageTemplate(
          leading: back,
          title: l10n.orderNumber('${order.number}'),
          subtitle: date,
          onRefresh: vm.refresh,
          children: [
            Wrap(
              spacing: Space.sm,
              runSpacing: Space.sm,
              children: [
                GBadge(
                  label: order.status.label(l10n),
                  tone: order.status.tone,
                ),
                // El cobro va aparte: solo se muestra cuando dice algo.
                if (order.paymentStatus != PaymentStatus.unpaid)
                  GBadge(
                    label: order.paymentStatus.label(l10n),
                    tone: order.paymentStatus.tone,
                  ),
              ],
            ),
            const SizedBox(height: Space.lg),
            GButton(
              label: l10n.orderWriteWhatsApp,
              variant: GButtonVariant.outline,
              icon: LucideIcons.messageCircle,
              onPressed: () => openExternalLink(
                context,
                whatsAppUri(
                  order.customerPhone,
                  l10n.orderWhatsAppMessage(
                    order.customerName.split(' ').first,
                    vm.storeName ?? l10n.appName,
                    '${order.number}',
                  ),
                ).toString(),
                failureMessage: l10n.errorOpenLink,
              ),
            ),
            const SizedBox(height: Space.xl),
            _ProductsSection(detail: detail),
            const SizedBox(height: Space.lg),
            _CustomerSection(order: order),
            const SizedBox(height: Space.lg),
            _statusSection(context, order),
            const SizedBox(height: Space.lg),
            _notesSection(context),
          ],
        );
      },
    );
  }

  Widget _statusSection(BuildContext context, Order order) {
    final l10n = AppLocalizations.of(context);
    final vm = widget.viewModel;
    final error = vm.changeStatus.error;

    return GSection(
      title: l10n.orderStatusTitle,
      description: vm.isCancelled
          ? l10n.orderStatusCancelledBody
          : l10n.orderStatusBody,
      trailing: vm.changeStatus.running
          ? Text(
              l10n.orderSaving,
              style: Theme.of(context).textTheme.bodySmall
                  ?.copyWith(color: context.colors.mutedForeground),
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GMenuGroup(
            children: [
              for (final status in OrderStatus.values)
                GSelectRow(
                  key: ValueKey(status),
                  label: status.label(l10n),
                  selected: order.status == status,
                  destructive: status == OrderStatus.cancelled,
                  onTap: vm.canChangeTo(status)
                      ? () => _selectStatus(status, order)
                      : null,
                ),
            ],
          ),
          if (error != null) ...[
            const SizedBox(height: Space.md),
            GInlineMessage(message: errorText(error, l10n)),
          ],
        ],
      ),
    );
  }

  Widget _notesSection(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final save = widget.viewModel.saveNotes;
    final error = save.error;

    return GSection(
      title: l10n.orderNotesTitle,
      description: l10n.orderNotesBody,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GTextField(
            controller: _notes,
            hintText: l10n.orderNotesHint,
            minLines: 3,
            maxLines: 8,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.sentences,
            // Al volver a escribir, el "Nota guardada" ya no aplica.
            onChanged: (_) => save.clearResult(),
          ),
          const SizedBox(height: Space.md),
          if (error != null) ...[
            GInlineMessage(message: errorText(error, l10n)),
            const SizedBox(height: Space.md),
          ] else if (save.completed) ...[
            GInlineMessage(
              message: l10n.orderNotesSaved,
              tone: GInlineMessageTone.success,
            ),
            const SizedBox(height: Space.md),
          ],
          GButton(
            label: save.running ? l10n.orderSaving : l10n.orderNotesSave,
            variant: GButtonVariant.outline,
            loading: save.running,
            onPressed: () {
              FocusScope.of(context).unfocus();
              save.execute(_notes.text);
            },
          ),
        ],
      ),
    );
  }
}

/// Las líneas del pedido y los totales.
class _ProductsSection extends StatelessWidget {
  const _ProductsSection({required this.detail});

  final OrderDetail detail;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;
    final order = detail.order;
    final muted = textTheme.bodySmall?.copyWith(color: colors.mutedForeground);
    final coupon = order.couponCode;
    final zone = order.shippingZoneName;

    Widget amountRow(String label, String value, {bool strong = false}) {
      final style = strong ? textTheme.titleSmall : textTheme.bodyMedium;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: Space.xs),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: strong
                    ? style
                    : style?.copyWith(color: colors.mutedForeground),
              ),
            ),
            Text(value, style: style),
          ],
        ),
      );
    }

    return GSection(
      title: l10n.orderProductsTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final item in detail.items)
            Padding(
              key: ValueKey(item.id),
              padding: const EdgeInsets.only(bottom: Space.md),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.productName, style: textTheme.bodyLarge),
                        if (item.variantLabel.isNotEmpty || item.sku != null)
                          Text(
                            [
                              if (item.variantLabel.isNotEmpty)
                                item.variantLabel,
                              ?item.sku,
                            ].join(' · '),
                            style: muted,
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: Space.md),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        formatMoney(item.lineTotal),
                        style: textTheme.bodyLarge,
                      ),
                      Text(
                        l10n.orderQtyTimesPrice(
                          '${item.qty}',
                          formatMoney(item.unitPrice),
                        ),
                        style: muted,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          Divider(height: Space.lg, color: colors.border),
          amountRow(l10n.orderSubtotal, formatMoney(order.subtotal)),
          if (order.discount > 0)
            amountRow(
              coupon == null
                  ? l10n.orderDiscount
                  : l10n.orderDiscountWithCoupon(coupon),
              formatMoney(-order.discount),
            ),
          amountRow(
            zone == null ? l10n.orderShipping : l10n.orderShippingZone(zone),
            order.shippingCost == 0
                ? l10n.orderShippingFree
                : formatMoney(order.shippingCost),
          ),
          Divider(height: Space.lg, color: colors.border),
          amountRow(l10n.orderTotal, formatMoney(order.total), strong: true),
        ],
      ),
    );
  }
}

/// A quién se le manda y lo que dejó escrito.
class _CustomerSection extends StatelessWidget {
  const _CustomerSection({required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;
    final muted = textTheme.bodyMedium?.copyWith(color: colors.mutedForeground);
    final notes = order.customerNotes;
    final opened = order.whatsappOpenedAt != null;

    return GSection(
      title: l10n.orderCustomerTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(order.customerName, style: textTheme.titleSmall),
          const SizedBox(height: Space.xs),
          SelectableText(order.customerPhone, style: muted),
          for (final line in [order.customerCity, order.customerAddress])
            if (line != null) SelectableText(line, style: muted),
          const SizedBox(height: Space.sm),
          Row(
            children: [
              Icon(
                opened
                    ? LucideIcons.messageCircle
                    : LucideIcons.messageCircleOff,
                size: 16,
                color: opened ? colors.primary : colors.mutedForeground,
              ),
              const SizedBox(width: Space.sm),
              Expanded(
                child: Text(
                  opened ? l10n.orderChatOpened : l10n.orderChatNotOpened,
                  style: textTheme.bodySmall?.copyWith(
                    color: colors.mutedForeground,
                  ),
                ),
              ),
            ],
          ),
          if (notes != null) ...[
            const SizedBox(height: Space.md),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Space.md),
              decoration: BoxDecoration(
                color: colors.muted,
                borderRadius: Radii.field,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.orderCustomerNotes,
                    style: textTheme.bodySmall?.copyWith(
                      color: colors.mutedForeground,
                    ),
                  ),
                  const SizedBox(height: Space.xs),
                  Text(notes, style: textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
