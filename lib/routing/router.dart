import 'package:flutter/widgets.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/routing/routes.dart';
import 'package:globerce_app/ui/auth/login/view_models/login_view_model.dart';
import 'package:globerce_app/ui/auth/login/widgets/login_screen.dart';
import 'package:globerce_app/ui/auth/store_picker/view_models/store_picker_view_model.dart';
import 'package:globerce_app/ui/auth/store_picker/widgets/store_picker_screen.dart';
import 'package:globerce_app/ui/home/view_models/home_view_model.dart';
import 'package:globerce_app/ui/home/widgets/home_screen.dart';
import 'package:globerce_app/ui/splash/view_models/splash_view_model.dart';
import 'package:globerce_app/ui/splash/widgets/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// El router de la app.
///
/// Escucha al [AuthRepository]: cada vez que la sesión cambia, [_redirect]
/// decide dónde debe estar la usuaria. Ninguna pantalla navega después de
/// entrar o salir.
GoRouter createRouter(AuthRepository auth) {
  return GoRouter(
    initialLocation: Routes.splash,
    refreshListenable: auth,
    redirect: (context, state) => _redirect(auth.status, state.matchedLocation),
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, _) =>
            SplashScreen(viewModel: SplashViewModel(auth: context.read())),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, _) =>
            LoginScreen(viewModel: LoginViewModel(auth: context.read())),
      ),
      GoRoute(
        path: Routes.stores,
        builder: (context, _) => StorePickerScreen(
          viewModel: StorePickerViewModel(auth: context.read()),
        ),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, _) =>
            HomeScreen(viewModel: HomeViewModel(auth: context.read())),
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
          ? Routes.home
          : null,
  };
}

/// Para los tests del redirect.
@visibleForTesting
String? redirectFor(AuthStatus status, String location) =>
    _redirect(status, location);
