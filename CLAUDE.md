# CLAUDE.md — Reglas del proyecto

Estas son las convenciones del proyecto, no sugerencias. Léelas enteras antes
de generar código. Si alguna se rompe, hay que justificarlo y anotarlo en
`docs/decisiones.md`.

Producto: la app móvil de **Globerce** para la dueña de la tienda y su equipo.
Habla directo con `ecommerce-api` (`../ecommerce-api`, prefijo `/v1`).

Stack: **Flutter (stable) + Dart 3**, con la arquitectura oficial de Flutter
(**MVVM**: capa UI + capa de datos). El plan completo está en
`docs/arquitectura.md`. Léelo antes de construir una pantalla.

Repo **público**: `github.com/kevin-martineze/globerce-app`. Nunca subas
secretos, tokens ni archivos `config/*.json` de producción.

---

## 1. Reglas duras

### Dart

1. **Prohibido `dynamic`** fuera del borde JSON. Lee el JSON con
   `json_serializable` / `freezed`, nunca a mano con `as`.
2. **Prohibido castear con `as`** en código de app. Si hace falta, se arregla
   el tipo en su origen o se usa `switch` con patrones.
3. **Prohibido `// ignore:`** para callar el analizador.
4. **Prohibido `print`.** Para depurar se usa `debugPrint`, y nunca con datos
   de clientas (teléfono, dirección, nombre) ni con tokens.
5. **`flutter analyze` en 0 issues.** `analysis_options.yaml` usa
   `strict-casts`, `strict-inference` y `strict-raw-types`.

### Arquitectura

6. **Capas:** `View → ViewModel → Repository → Service`. Ninguna capa se
   salta otra ni importa una de arriba.
7. **Un ViewModel por pantalla**, que extiende `ChangeNotifier`. No conoce
   `BuildContext`, ni widgets, ni JSON.
8. **Las Views no tienen lógica.** Pintan el estado y llaman a `Command`s.
9. **Las acciones asíncronas de la UI son `Command`s** (`utils/command.dart`).
   El botón se deshabilita mientras `running`.
10. **La capa de datos nunca lanza: devuelve `Result<T>`** (`utils/result.dart`).
    `AppError.message` ya viene en español y listo para mostrar. Las
    decisiones se toman con `AppError.code`, nunca leyendo el texto.
11. **Las pantallas nunca ven un DTO.** El JSON se lee en
    `data/services/api/models/` y el repositorio lo traduce a
    `domain/models/`.
12. **Cada repositorio es una `abstract class` con dos implementaciones,
    `Remote` y `Fake`.** El fake es real: sirve para los tests y para correr
    la app sin API.
13. **Las dependencias se arman en `config/dependencies.dart`** con
    `provider`. No se instancian services ni repositorios dentro de widgets.
14. **La navegación va solo por `go_router`**, con las rutas definidas en
    `routing/routes.dart`. Nunca se usa `Navigator.push` suelto.

### Sesión

15. **El `accessToken` vive en memoria y el `refreshToken` en
    `flutter_secure_storage`.** Nada de la sesión va a `SharedPreferences`.
16. **El refresh es single-flight**, y el token nuevo se guarda **antes** de
    soltar las peticiones en espera. La API revoca todas las sesiones si ve
    un refresh token reusado (ver `docs/arquitectura.md` §6).

### UI

17. **Atomic design:** `tokens → atoms → molecules → organisms → templates →
    screens`, en `ui/core/`. Cada nivel importa solo de los niveles inferiores.
18. **Las pantallas usan los componentes de `ui/core/`.** Nada de
    `ElevatedButton`, `TextField` ni colores sueltos para lo que lleva marca.
19. **Solo tokens.** Los colores se leen con `context.colors.*` (la
    `ThemeExtension`). Cero `Color(0xFF…)` fuera de `ui/core/tokens/`.
20. **Iconos: solo Lucide** (`lucide_icons_flutter`). Cero emojis en la
    interfaz.
21. **Todo widget de lista lleva `key`** cuando sus elementos pueden cambiar
    de orden.
22. **Usa constructores `const` siempre que se pueda.**
23. **Todo funciona en modo oscuro, con el texto grande de accesibilidad y
    con el teclado abierto.**

---

## 2. Idioma

- **Código, nombres de archivos, rutas e identificadores en inglés.**
- **Comentarios y documentación en español.**
- **Textos de cara a la usuaria en español de Colombia, tuteando y sin
  tecnicismos.** Todos van en `ui/core/l10n/app_es.arb`, ninguno escrito a
  mano en un widget.
- Los precios se muestran como `$18.000`, sin decimales.
- Los estados internos van en inglés y se traducen al pintarlos.

---

## 3. Puertas de calidad

Todo esto tiene que pasar antes de dar algo por terminado:

```bash
dart format --set-exit-if-changed .
flutter analyze
flutter test
flutter build ios --simulator --debug
```

Si una falla, se arregla la causa, sin `// ignore:` ni tests saltados.

Flutter vive en `~/development/flutter` (este Mac es Intel y no tiene
Homebrew). El simulador por defecto es el iPhone 17 Pro.
