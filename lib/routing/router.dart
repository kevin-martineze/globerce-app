import 'package:flutter/widgets.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/routing/routes.dart';
import 'package:globerce_app/ui/auth/login/view_models/login_view_model.dart';
import 'package:globerce_app/ui/auth/login/widgets/login_screen.dart';
import 'package:globerce_app/ui/auth/store_picker/view_models/store_picker_view_model.dart';
import 'package:globerce_app/ui/auth/store_picker/widgets/store_picker_screen.dart';
import 'package:globerce_app/ui/core/l10n/generated/app_localizations.dart';
import 'package:globerce_app/ui/core/utils/view_model_scope.dart';
import 'package:globerce_app/ui/more/view_models/more_view_model.dart';
import 'package:globerce_app/ui/more/widgets/more_screen.dart';
import 'package:globerce_app/ui/orders/view_models/order_detail_view_model.dart';
import 'package:globerce_app/ui/orders/view_models/orders_view_model.dart';
import 'package:globerce_app/ui/orders/widgets/order_detail_screen.dart';
import 'package:globerce_app/ui/orders/widgets/orders_screen.dart';
import 'package:globerce_app/ui/panel/widgets/coming_soon_screen.dart';
import 'package:globerce_app/ui/panel/widgets/panel_shell.dart';
import 'package:globerce_app/ui/splash/view_models/splash_view_model.dart';
import 'package:globerce_app/ui/splash/widgets/splash_screen.dart';
import 'package:globerce_app/ui/summary/view_models/summary_view_model.dart';
import 'package:globerce_app/ui/summary/widgets/summary_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

/// El router de la app.
///
/// Escucha al [AuthRepository]: cada vez que la sesión cambia, [_redirect]
/// decide dónde debe estar la usuaria. Ninguna pantalla navega después de
/// entrar o salir.
///
/// Los ViewModels se crean con [ViewModelScope] y no directo en el `builder`:
/// el router vuelve a llamar al `builder` en cada refresco y la pantalla
/// perdería su estado a mitad de una acción.
GoRouter createRouter(AuthRepository auth) {
  return GoRouter(
    initialLocation: Routes.splash,
    refreshListenable: auth,
    redirect: (context, state) => _redirect(auth.status, state.matchedLocation),
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, _) => ViewModelScope(
          create: (context) => SplashViewModel(auth: context.read()),
          builder: (_, vm) => SplashScreen(viewModel: vm),
        ),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, _) => ViewModelScope(
          create: (context) => LoginViewModel(auth: context.read()),
          builder: (_, vm) => LoginScreen(viewModel: vm),
        ),
      ),
      GoRoute(
        path: Routes.stores,
        builder: (context, _) => ViewModelScope(
          create: (context) => StorePickerViewModel(auth: context.read()),
          builder: (_, vm) => StorePickerScreen(viewModel: vm),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, _, navigationShell) =>
            PanelShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.summary,
                builder: (context, _) => ViewModelScope(
                  create: (context) => SummaryViewModel(
                    auth: context.read(),
                    orders: context.read(),
                  ),
                  builder: (_, vm) => SummaryScreen(viewModel: vm),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.orders,
                builder: (context, _) => ViewModelScope(
                  create: (context) => OrdersViewModel(orders: context.read()),
                  builder: (_, vm) => OrdersScreen(viewModel: vm),
                ),
                routes: [
                  GoRoute(
                    path: ':orderId',
                    builder: (context, state) {
                      final orderId = state.pathParameters['orderId'] ?? '';
                      return ViewModelScope(
                        // Otro pedido es otra pantalla, con su propio ViewModel.
                        key: ValueKey(orderId),
                        create: (context) => OrderDetailViewModel(
                          orderId: orderId,
                          orders: context.read(),
                          auth: context.read(),
                        ),
                        builder: (_, vm) => OrderDetailScreen(viewModel: vm),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.products,
                builder: (context, _) {
                  final l10n = AppLocalizations.of(context);
                  return ComingSoonScreen(
                    title: l10n.navProducts,
                    icon: LucideIcons.shirt,
                    emptyTitle: l10n.productsComingTitle,
                    emptyBody: l10n.productsComingBody,
                    webPath: '/admin/products',
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.inventory,
                builder: (context, _) {
                  final l10n = AppLocalizations.of(context);
                  return ComingSoonScreen(
                    title: l10n.navInventory,
                    icon: LucideIcons.boxes,
                    emptyTitle: l10n.inventoryComingTitle,
                    emptyBody: l10n.inventoryComingBody,
                    webPath: '/admin/inventory',
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.more,
                builder: (context, _) => ViewModelScope(
                  create: (context) => MoreViewModel(auth: context.read()),
                  builder: (_, vm) => MoreScreen(viewModel: vm),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

String? _redirect(AuthStatus status, String location) {
  String? only(String route) => location == route ? null : route;

  return switch (status) {
    AuthStatus.unknown => only(Routes.splash),
    AuthStatus.signedOut => only(Routes.login),
    AuthStatus.choosingStore => only(Routes.stores),
    // Con sesión, el selector sigue disponible para cambiar de tienda.
    AuthStatus.signedIn =>
      location == Routes.splash || location == Routes.login
          ? Routes.summary
          : null,
  };
}

/// Para los tests del redirect.
@visibleForTesting
String? redirectFor(AuthStatus status, String location) =>
    _redirect(status, location);
