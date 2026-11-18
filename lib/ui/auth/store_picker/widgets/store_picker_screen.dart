import 'package:flutter/material.dart';
import 'package:globerce_app/domain/models/session.dart';
import 'package:globerce_app/routing/routes.dart';
import 'package:globerce_app/ui/auth/store_picker/view_models/store_picker_view_model.dart';
import 'package:globerce_app/ui/auth/store_picker/widgets/store_tile.dart';
import 'package:globerce_app/ui/core/atoms/g_link.dart';
import 'package:globerce_app/ui/core/l10n/generated/app_localizations.dart';
import 'package:globerce_app/ui/core/molecules/g_inline_message.dart';
import 'package:globerce_app/ui/core/templates/auth_template.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';
import 'package:globerce_app/ui/core/utils/error_text.dart';
import 'package:go_router/go_router.dart';

/// Elegir con cuál tienda trabajar.
///
/// Aparece después del login si la cuenta tiene varias tiendas, y desde el
/// inicio con "Cambiar de tienda".
class StorePickerScreen extends StatefulWidget {
  const StorePickerScreen({super.key, required this.viewModel});

  final StorePickerViewModel viewModel;

  @override
  State<StorePickerScreen> createState() => _StorePickerScreenState();
}

class _StorePickerScreenState extends State<StorePickerScreen> {
  StorePickerViewModel get _vm => widget.viewModel;

  @override
  void initState() {
    super.initState();
    _vm.select.addListener(_onSelect);
  }

  @override
  void dispose() {
    _vm.select.removeListener(_onSelect);
    _vm.dispose();
    super.dispose();
  }

  /// Si se eligió la misma tienda activa, el estado de la sesión no cambia y
  /// el router no redirige: por eso aquí se navega a mano.
  void _onSelect() {
    if (_vm.select.completed && mounted) context.go(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AuthTemplate(
      eyebrow: l10n.storePickerEyebrow,
      title: l10n.storePickerTitle,
      logoLabel: l10n.brandMarkLabel,
      footer: ListenableBuilder(
        listenable: _vm.logout,
        builder: (context, _) => GLink(
          label: _vm.logout.running ? l10n.loggingOut : l10n.logout,
          onTap: _vm.logout.running ? null : _vm.logout.execute,
        ),
      ),
      child: ListenableBuilder(
        listenable: _vm.select,
        builder: (context, _) {
          final busy = _vm.select.running || _vm.logout.running;
          final error = _vm.select.error;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final store in _vm.stores) ...[
                StoreTile(
                  key: ValueKey(store.id),
                  name: store.name,
                  role: store.role == StoreRole.owner
                      ? l10n.roleOwner
                      : l10n.roleStaff,
                  active: store.id == _vm.activeStoreId,
                  loading: store.id == _vm.pendingStoreId,
                  onTap: busy ? null : () => _vm.select.execute(store.id),
                ),
                const SizedBox(height: Space.md),
              ],
              if (error != null) ...[
                const SizedBox(height: Space.sm),
                GInlineMessage(message: errorText(error, l10n)),
              ],
            ],
          );
        },
      ),
    );
  }
}
