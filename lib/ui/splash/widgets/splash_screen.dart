import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/atoms/g_button.dart';
import 'package:globerce_app/ui/core/atoms/g_logo.dart';
import 'package:globerce_app/ui/core/l10n/generated/app_localizations.dart';
import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';
import 'package:globerce_app/ui/core/utils/error_text.dart';
import 'package:globerce_app/ui/splash/view_models/splash_view_model.dart';

/// El isotipo mientras se revisa la sesión guardada.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.viewModel});

  final SplashViewModel viewModel;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.colors;
    final restore = widget.viewModel.restore;

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(Space.gutter),
            child: ListenableBuilder(
              listenable: restore,
              builder: (context, _) {
                final error = restore.error;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GLogo(size: 64, semanticLabel: l10n.brandMarkLabel),
                    const SizedBox(height: Space.xl),
                    if (error == null)
                      SizedBox.square(
                        dimension: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colors.primary,
                        ),
                      )
                    else ...[
                      Text(
                        l10n.splashRestoreFailed,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: Space.sm),
                      Text(
                        errorText(error, l10n),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(color: colors.mutedForeground),
                      ),
                      const SizedBox(height: Space.xl),
                      GButton(
                        label: l10n.retry,
                        expand: false,
                        loading: restore.running,
                        onPressed: restore.execute,
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
