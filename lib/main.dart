import 'package:flutter/material.dart';
import 'package:globerce_app/app.dart';
import 'package:globerce_app/config/dependencies.dart';
import 'package:provider/provider.dart';

/// Arranque. El entorno llega con `--dart-define-from-file=config/<env>.json`.
///
/// ```bash
/// flutter run --dart-define-from-file=config/sim.json   # contra la API local
/// flutter run --dart-define-from-file=config/fake.json  # sin API
/// ```
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: appProviders(), child: const GloberceApp()));
}
