import 'package:globerce_app/domain/models/order.dart';
import 'package:globerce_app/ui/core/atoms/g_badge.dart';
import 'package:globerce_app/ui/core/l10n/generated/app_localizations.dart';

/// Cómo se pintan los estados de un pedido. Se guardan en inglés y se
/// traducen solo aquí.
extension OrderStatusLabels on OrderStatus {
  String label(AppLocalizations l10n) {
    return switch (this) {
      OrderStatus.pending => l10n.orderStatusPending,
      OrderStatus.confirmed => l10n.orderStatusConfirmed,
      OrderStatus.shipped => l10n.orderStatusShipped,
      OrderStatus.delivered => l10n.orderStatusDelivered,
      OrderStatus.cancelled => l10n.orderStatusCancelled,
    };
  }

  /// En plural, para los filtros de la lista.
  String filterLabel(AppLocalizations l10n) {
    return switch (this) {
      OrderStatus.pending => l10n.ordersFilterPending,
      OrderStatus.confirmed => l10n.ordersFilterConfirmed,
      OrderStatus.shipped => l10n.ordersFilterShipped,
      OrderStatus.delivered => l10n.ordersFilterDelivered,
      OrderStatus.cancelled => l10n.ordersFilterCancelled,
    };
  }

  /// Pendiente en terracota porque alguien espera; lo que avanza en teal.
  GBadgeTone get tone {
    return switch (this) {
      OrderStatus.pending => GBadgeTone.caution,
      OrderStatus.confirmed || OrderStatus.shipped => GBadgeTone.primary,
      OrderStatus.delivered => GBadgeTone.neutral,
      OrderStatus.cancelled => GBadgeTone.destructive,
    };
  }
}

extension PaymentStatusLabels on PaymentStatus {
  String label(AppLocalizations l10n) {
    return switch (this) {
      PaymentStatus.unpaid => l10n.paymentUnpaid,
      PaymentStatus.pending => l10n.paymentPending,
      PaymentStatus.paid => l10n.paymentPaid,
      PaymentStatus.failed => l10n.paymentFailed,
    };
  }

  GBadgeTone get tone {
    return switch (this) {
      PaymentStatus.paid => GBadgeTone.primary,
      PaymentStatus.failed => GBadgeTone.destructive,
      PaymentStatus.unpaid || PaymentStatus.pending => GBadgeTone.neutral,
    };
  }
}
