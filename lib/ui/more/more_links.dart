import 'package:flutter/widgets.dart';

import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Los grupos de "Más", con los mismos nombres del panel web.
enum MoreGroup { store, account }

/// Las secciones del panel que no tienen pestaña propia.
enum MoreLinkId {
  collections,
  design,
  catalogs,
  coupons,
  shipping,
  domain,
  restockAlerts,
  support,
  settings,
  team,
  payments,
  plan,
  account,
}

/// Una sección de "Más". Mientras no tenga pantalla nativa, abre el panel web
/// en [webPath].
class MoreLink {
  const MoreLink({
    required this.id,
    required this.group,
    required this.icon,
    required this.webPath,
    this.ownerOnly = false,
  });

  final MoreLinkId id;
  final MoreGroup group;
  final IconData icon;
  final String webPath;

  /// Solo la ve la dueña, igual que en la web.
  final bool ownerOnly;
}

/// Mismo orden e iconos que `ADMIN_NAV` en
/// `shopping-sas/src/lib/config/admin-nav.ts`. Colecciones baja a "Tienda"
/// porque en el teléfono no cabe como pestaña.
const moreLinks = [
  MoreLink(
    id: MoreLinkId.collections,
    group: MoreGroup.store,
    icon: LucideIcons.images,
    webPath: '/admin/collections',
  ),
  MoreLink(
    id: MoreLinkId.design,
    group: MoreGroup.store,
    icon: LucideIcons.paintbrush,
    webPath: '/admin/design',
  ),
  MoreLink(
    id: MoreLinkId.catalogs,
    group: MoreGroup.store,
    icon: LucideIcons.palette,
    webPath: '/admin/catalogs',
  ),
  MoreLink(
    id: MoreLinkId.coupons,
    group: MoreGroup.store,
    icon: LucideIcons.ticket,
    webPath: '/admin/coupons',
  ),
  MoreLink(
    id: MoreLinkId.shipping,
    group: MoreGroup.store,
    icon: LucideIcons.truck,
    webPath: '/admin/shipping',
  ),
  MoreLink(
    id: MoreLinkId.domain,
    group: MoreGroup.store,
    icon: LucideIcons.globe,
    webPath: '/admin/domain',
    ownerOnly: true,
  ),
  MoreLink(
    id: MoreLinkId.restockAlerts,
    group: MoreGroup.store,
    icon: LucideIcons.bellRing,
    webPath: '/admin/restock-alerts',
  ),
  MoreLink(
    id: MoreLinkId.support,
    group: MoreGroup.account,
    icon: LucideIcons.lifeBuoy,
    webPath: '/admin/support',
  ),
  MoreLink(
    id: MoreLinkId.settings,
    group: MoreGroup.account,
    icon: LucideIcons.settings,
    webPath: '/admin/settings',
  ),
  MoreLink(
    id: MoreLinkId.team,
    group: MoreGroup.account,
    icon: LucideIcons.users,
    webPath: '/admin/team',
  ),
  MoreLink(
    id: MoreLinkId.payments,
    group: MoreGroup.account,
    icon: LucideIcons.wallet,
    webPath: '/admin/payments',
  ),
  MoreLink(
    id: MoreLinkId.plan,
    group: MoreGroup.account,
    icon: LucideIcons.creditCard,
    webPath: '/admin/plan',
  ),
  MoreLink(
    id: MoreLinkId.account,
    group: MoreGroup.account,
    icon: LucideIcons.userRound,
    webPath: '/admin/account',
  ),
];
