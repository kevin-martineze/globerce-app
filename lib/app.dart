import 'package:flutter/material.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/routing/router.dart';
import 'package:globerce_app/ui/core/l10n/generated/app_localizations.dart';
import 'package:globerce_app/ui/core/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// La app: tema claro/oscuro según el sistema, español y el router.
class GloberceApp extends StatefulWidget {
  const GloberceApp({super.key});

  @override
  State<GloberceApp> createState() => _GloberceAppState();
}

class _GloberceAppState extends State<GloberceApp> {
  // Se crea una sola vez: si se creara en build, cada cambio de tema
  // reiniciaría la navegación.
  late final GoRouter _router = createRouter(context.read<AuthRepository>());

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      locale: const Locale('es'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _router,
    );
  }
}
