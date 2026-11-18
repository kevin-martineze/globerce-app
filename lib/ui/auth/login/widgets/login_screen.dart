import 'package:flutter/material.dart';

import 'package:globerce_app/config/env.dart';
import 'package:globerce_app/ui/auth/login/view_models/login_view_model.dart';
import 'package:globerce_app/ui/core/atoms/g_button.dart';
import 'package:globerce_app/ui/core/atoms/g_link.dart';
import 'package:globerce_app/ui/core/atoms/g_text_field.dart';
import 'package:globerce_app/ui/core/l10n/generated/app_localizations.dart';
import 'package:globerce_app/ui/core/molecules/g_form_field.dart';
import 'package:globerce_app/ui/core/molecules/g_inline_message.dart';
import 'package:globerce_app/ui/core/molecules/g_password_field.dart';
import 'package:globerce_app/ui/core/templates/auth_template.dart';
import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';
import 'package:globerce_app/ui/core/utils/error_text.dart';
import 'package:globerce_app/ui/core/utils/open_link.dart';

/// Iniciar sesión. Los textos son los mismos de `/admin/login` en la web.
///
/// La pantalla no navega: cuando el login sale bien, el repositorio cambia de
/// estado y el router redirige.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordFocus = FocusNode();

  LoginViewModel get _vm => widget.viewModel;

  @override
  void dispose() {
    _passwordFocus.dispose();
    _vm.dispose();
    super.dispose();
  }

  void _submit() {
    // Cierra el teclado para que el mensaje de error, si lo hay, quede a la vista.
    FocusScope.of(context).unfocus();
    _vm.submit();
  }

  String? _fieldError(
    LoginFieldError? error, {
    required String required,
    String? invalid,
  }) {
    return switch (error) {
      null => null,
      LoginFieldError.required => required,
      LoginFieldError.invalid => invalid ?? required,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.colors;

    return AuthTemplate(
      eyebrow: l10n.brandEyebrow,
      title: l10n.loginTitle,
      logoLabel: l10n.brandMarkLabel,
      footer: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: Space.xs,
        children: [
          Text(
            l10n.loginNoStoreQuestion,
            style: Theme.of(context).textTheme.bodySmall
                ?.copyWith(color: colors.mutedForeground),
          ),
          GLink(
            label: l10n.loginCreateStore,
            onTap: () => openExternalLink(
              context,
              '${Env.webBaseUrl}/signup',
              failureMessage: l10n.errorOpenLink,
            ),
          ),
        ],
      ),
      child: ListenableBuilder(
        listenable: Listenable.merge([_vm, _vm.login]),
        builder: (context, _) {
          final sending = _vm.login.running;
          final error = _vm.login.error;

          return AutofillGroup(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GFormField(
                  label: l10n.loginEmailLabel,
                  child: GTextField(
                    hintText: l10n.loginEmailHint,
                    enabled: !sending,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autofillHints: const [
                      AutofillHints.email,
                      AutofillHints.username,
                    ],
                    autocorrect: false,
                    errorText: _fieldError(
                      _vm.emailError,
                      required: l10n.validationEmailRequired,
                      invalid: l10n.validationEmailInvalid,
                    ),
                    onChanged: _vm.setEmail,
                    onSubmitted: (_) => _passwordFocus.requestFocus(),
                  ),
                ),
                const SizedBox(height: Space.lg),
                GFormField(
                  label: l10n.loginPasswordLabel,
                  action: GLink(
                    label: l10n.loginForgotPassword,
                    onTap: () => openExternalLink(
                      context,
                      '${Env.webBaseUrl}/admin/forgot-password',
                      failureMessage: l10n.errorOpenLink,
                    ),
                  ),
                  child: GPasswordField(
                    focusNode: _passwordFocus,
                    enabled: !sending,
                    showLabel: l10n.passwordShow,
                    hideLabel: l10n.passwordHide,
                    textInputAction: TextInputAction.done,
                    errorText: _fieldError(
                      _vm.passwordError,
                      required: l10n.validationPasswordRequired,
                    ),
                    onChanged: _vm.setPassword,
                    onSubmitted: (_) => _submit(),
                  ),
                ),
                if (error != null) ...[
                  const SizedBox(height: Space.lg),
                  GInlineMessage(message: errorText(error, l10n)),
                ],
                const SizedBox(height: Space.xl),
                GButton(
                  label: sending ? l10n.loginSubmitting : l10n.loginSubmit,
                  loading: sending,
                  onPressed: _submit,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
