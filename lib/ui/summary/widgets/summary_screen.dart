import 'package:flutter/material.dart';
import 'package:globerce_app/ui/core/atoms/g_logo.dart';
import 'package:globerce_app/ui/core/l10n/generated/app_localizations.dart';
import 'package:globerce_app/ui/core/molecules/g_empty_state.dart';
import 'package:globerce_app/ui/core/templates/panel_page_template.dart';
import 'package:globerce_app/ui/summary/view_models/summary_view_model.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// La primera pestaña del panel.
class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key, required this.viewModel});

  final SummaryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final firstName = viewModel.firstName;
        final store = viewModel.activeStore;

        return PanelPageTemplate(
          leading: Align(
            alignment: Alignment.centerLeft,
            child: GLogo(size: 36, semanticLabel: l10n.brandMarkLabel),
          ),
          title: firstName == null
              ? l10n.homeGreetingNoName
              : l10n.homeGreeting(firstName),
          subtitle: store == null ? null : l10n.homeActiveStore(store.name),
          children: [
            GEmptyState(
              icon: LucideIcons.chartNoAxesColumn,
              title: l10n.summaryTodayTitle,
              body: l10n.summaryTodayBody,
            ),
          ],
        );
      },
    );
  }
}
