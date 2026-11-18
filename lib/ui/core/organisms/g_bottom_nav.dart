import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/typography.dart';

/// Un destino de la barra inferior.
class GBottomNavItem {
  const GBottomNavItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

/// La barra inferior del panel.
///
/// La pestaña activa va en el color del texto con el indicador en lino, no en
/// teal: el teal queda para la acción principal de cada pantalla.
class GBottomNav extends StatelessWidget {
  const GBottomNav({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onSelect,
  });

  final List<GBottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final labelStyle = Theme.of(context).textTheme.labelSmall;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.border)),
      ),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: colors.background,
          surfaceTintColor: Colors.transparent,
          indicatorColor: colors.muted,
          elevation: 0,
          height: 64,
          labelTextStyle: WidgetStateProperty.resolveWith(
            (states) => labelStyle?.copyWith(
              letterSpacing: 0,
              fontSize: 11,
              fontWeight: states.contains(WidgetState.selected)
                  ? GloberceTypography.semibold
                  : FontWeight.w500,
              color: states.contains(WidgetState.selected)
                  ? colors.foreground
                  : colors.mutedForeground,
            ),
          ),
          iconTheme: WidgetStateProperty.resolveWith(
            (states) => IconThemeData(
              size: 22,
              color: states.contains(WidgetState.selected)
                  ? colors.foreground
                  : colors.mutedForeground,
            ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: onSelect,
          destinations: [
            for (final item in items)
              NavigationDestination(icon: Icon(item.icon), label: item.label),
          ],
        ),
      ),
    );
  }
}
