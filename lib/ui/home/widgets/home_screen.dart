import 'package:flutter/material.dart';
import 'package:globerce_app/routing/routes.dart';
import 'package:globerce_app/ui/core/atoms/g_button.dart';
import 'package:globerce_app/ui/core/atoms/g_logo.dart';
import 'package:globerce_app/ui/core/l10n/generated/app_localizations.dart';
import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';
import 'package:globerce_app/ui/home/view_models/home_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Inicio provisional: confirma que la sesión quedó abierta. Lo reemplaza el
/// shell del panel en la fase 2.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel get _vm => widget.viewModel;

  @override
  void dispose() {
    _vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;
    final firstName = _vm.firstName;
    final store = _vm.activeStore;

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Space.gutter),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GLogo(size: 36, semanticLabel: l10n.brandMarkLabel),
              ),
              const SizedBox(height: Space.xxl),
              Semantics(
                header: true,
                child: Text(
                  firstName == null
                      ? l10n.homeGreetingNoName
                      : l10n.homeGreeting(firstName),
                  style: textTheme.headlineMedium,
                ),
              ),
              if (store != null) ...[
                const SizedBox(height: Space.sm),
                Text(
                  l10n.homeActiveStore(store.name),
                  style: textTheme.bodyLarge?.copyWith(
                    color: colors.mutedForeground,
                  ),
                ),
              ],
              const SizedBox(height: Space.xl),
              Container(
                padding: const EdgeInsets.all(Space.xl),
                decoration: BoxDecoration(
                  color: colors.muted,
                  borderRadius: Radii.card,
                ),
                child: Text(l10n.homeComingSoon, style: textTheme.bodyLarge),
              ),
              const SizedBox(height: Space.xxl),
              if (_vm.canSwitchStore) ...[
                GButton(
                  label: l10n.homeSwitchStore,
                  variant: GButtonVariant.outline,
                  icon: LucideIcons.arrowLeftRight,
                  onPressed: () => context.go(Routes.stores),
                ),
                const SizedBox(height: Space.md),
              ],
              ListenableBuilder(
                listenable: _vm.logout,
                builder: (context, _) => GButton(
                  label: _vm.logout.running ? l10n.loggingOut : l10n.logout,
                  variant: GButtonVariant.outline,
                  icon: LucideIcons.logOut,
                  loading: _vm.logout.running,
                  onPressed: _vm.logout.execute,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
