import 'package:flutter/material.dart';
import 'package:globerce_app/domain/models/order.dart';
import 'package:globerce_app/ui/core/atoms/g_badge.dart';
import 'package:globerce_app/ui/core/l10n/generated/app_localizations.dart';
import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';
import 'package:globerce_app/ui/core/utils/format.dart';
import 'package:globerce_app/ui/orders/order_labels.dart';
import 'package:intl/intl.dart';

/// Un pedido en la lista: número, clienta, cuándo, total y estado.
class OrderTile extends StatelessWidget {
  const OrderTile({super.key, required this.order, required this.onTap});

  final Order order;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final date = DateFormat('d MMM, h:mm a', locale).format(order.createdAt);
    final cancelled = order.status == OrderStatus.cancelled;

    return Semantics(
      button: true,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Space.lg,
            vertical: Space.md + 2,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.orderNumberShort('${order.number}'),
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.mutedForeground,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      order.customerName,
                      style: textTheme.titleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      date,
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.mutedForeground,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: Space.md),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    formatMoney(order.total),
                    style: textTheme.titleSmall?.copyWith(
                      color: cancelled ? colors.mutedForeground : null,
                      decoration: cancelled ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  const SizedBox(height: Space.sm),
                  GBadge(
                    label: order.status.label(l10n),
                    tone: order.status.tone,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
