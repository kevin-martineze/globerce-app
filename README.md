# Globerce App

App móvil de Globerce para la dueña de la tienda y su equipo. Flutter + Dart,
arquitectura MVVM oficial de Flutter, contra `ecommerce-api`.

- Plan y arquitectura: [`docs/arquitectura.md`](docs/arquitectura.md)
- Reglas del proyecto: [`CLAUDE.md`](CLAUDE.md)

## Correr

```bash
flutter pub get
dart run build_runner build -d

# Sin API, con cuentas de prueba (contraseña `globerce123`)
flutter run --dart-define-from-file=config/fake.json

# Contra la API local en localhost:3000
flutter run --dart-define-from-file=config/sim.json
```

## Puertas de calidad

```bash
dart format --set-exit-if-changed .
flutter analyze
flutter test
flutter build ios --simulator --debug
```
