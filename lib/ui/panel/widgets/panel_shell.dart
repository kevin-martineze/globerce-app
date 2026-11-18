import 'package:flutter/material.dart';
import 'package:globerce_app/ui/core/l10n/generated/app_localizations.dart';
import 'package:globerce_app/ui/core/organisms/g_bottom_nav.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// El shell del panel: las pestañas y la barra inferior.
///
/// Cada pestaña guarda su propia pila de navegación (`StatefulShellRoute`), así
/// que al volver a una pestaña se encuentra donde se dejó. Tocar la pestaña
/// activa la devuelve a su raíz, como en las apps de iOS.
///
/// El orden sale del panel web (`shopping-sas/src/lib/config/admin-nav.ts`):
/// lo del día a día va abajo, y el resto queda en "Más".
class PanelShell extends StatelessWidget {
  const PanelShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: GBottomNav(
        currentIndex: navigationShell.currentIndex,
        onSelect: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        items: [
          GBottomNavItem(
            icon: LucideIcons.layoutDashboard,
            label: l10n.navSummary,
          ),
          GBottomNavItem(icon: LucideIcons.receipt, label: l10n.navOrders),
          GBottomNavItem(icon: LucideIcons.shirt, label: l10n.navProducts),
          GBottomNavItem(icon: LucideIcons.boxes, label: l10n.navInventory),
          GBottomNavItem(icon: LucideIcons.ellipsis, label: l10n.navMore),
        ],
      ),
    );
  }
}
