import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/data/services/api/api_error.dart';
import 'package:globerce_app/ui/core/l10n/generated/app_localizations.dart';
import 'package:globerce_app/utils/result.dart';

/// El texto que ve la usuaria para un [AppError].
///
/// Los errores que vienen de la API ya traen su `message` en español y se
/// muestran tal cual. Los que genera la app —sin conexión, tiempo agotado—
/// toman su texto de los ARB.
String errorText(AppError error, AppLocalizations l10n) {
  return switch (error.code) {
    AppError.network => l10n.errorNetwork,
    AppError.timeout => l10n.errorTimeout,
    AppError.unknown || ApiErrorCode.invalidResponse => l10n.errorUnknown,
    ApiErrorCode.tooManyRequests => l10n.errorTooManyAttempts,
    AuthErrorCode.noStores => '${l10n.noStoresTitle}. ${l10n.noStoresBody}',
    AuthErrorCode.noSession => l10n.errorSessionExpired,
    _ => error.message,
  };
}
