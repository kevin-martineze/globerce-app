# Globerce App — Plan de arquitectura

App móvil de Globerce para la **dueña de la tienda y su equipo** (roles `OWNER`
y `STAFF`). Primera entrega visual: **el login**.

La app habla directo con `ecommerce-api` (`/v1`). A diferencia de
`shopping-sas`, aquí no hay un servidor SvelteKit en medio: la sesión vive en
el teléfono, y eso cambia cómo se guardan y se refrescan los tokens (ver §6).

---

## 1. Decisiones

| Tema | Decisión | Por qué |
| --- | --- | --- |
| Arquitectura | La guía oficial de Flutter ([app-architecture](https://docs.flutter.dev/app-architecture)): capa UI + capa de datos, **MVVM** | Es el estándar del equipo de Flutter, escala sin ceremonia y tiene ejemplos oficiales (Compass). |
| Estado | `ChangeNotifier` + `ListenableBuilder` | Viene con Flutter. Un ViewModel es un `ChangeNotifier`: no hace falta otra librería para MVVM. |
| Inyección | `provider` | Lo que recomienda la guía. Solo inyecta; no maneja estado. |
| Navegación | `go_router` con `redirect` según la sesión | Rutas declarativas, deep links y guardas de sesión en un solo lugar. |
| HTTP | `dio` con un interceptor de sesión | Interceptores en cola (`QueuedInterceptor`) para refrescar el token una sola vez aunque fallen varias peticiones a la vez. |
| Modelos | `freezed` + `json_serializable` | Inmutables, `copyWith`, igualdad y `fromJson` generados. |
| Errores | `Result<T>` sellado (`Ok` / `Error`) | Equivale a `ApiResult<T>` de la web: la capa de datos **nunca lanza** hacia arriba. |
| Acciones de UI | Patrón `Command` | Cada acción asíncrona expone `running`, `error` y `completed`; el botón se deshabilita solo. |
| Sesión en disco | `flutter_secure_storage` (Keychain / Keystore) | El refresh token dura 30 días: nunca va a `SharedPreferences`. |
| Textos | `gen-l10n` con un ARB `es` | Todos los textos en un archivo, tuteando, en español de Colombia. |
| Iconos | Lucide (`lucide_icons_flutter`) | Los mismos iconos que la web. |
| Fuente | Inter Tight empaquetada en `assets/fonts/` | Es la fuente de las pantallas de acceso de Globerce en la web. Va empaquetada, no por `google_fonts`, para que no dependa de la red. |
| Lints | `flutter_lints` + `strict-casts`, `strict-inference`, `strict-raw-types` | Equivale al TypeScript strict de la web. |
| Entornos | `--dart-define-from-file=config/<env>.json` | La URL de la API cambia entre el simulador, un teléfono físico y producción. |
| Tests | `flutter_test` + **fakes** de repositorios | Sin mocks: un `FakeAuthRepository` en memoria sirve para los tests y para correr la app sin API. |

Lo que se descartó:

- **Riverpod / Bloc**: los dos funcionan bien, pero agregan su propio modelo
  mental encima de MVVM. Si un día hace falta, el cambio queda dentro de los
  ViewModels.
- **Capa de dominio con casos de uso**: la guía la deja como opcional. Se
  agrega solo cuando una lógica combine varios repositorios. El login no lo
  necesita.

---

## 2. Capas y flujo de datos

```
 ┌──────────── UI ────────────┐   ┌──────────── Datos ────────────┐
 │                            │   │                               │
 │  View  ──eventos──▶ ViewModel ──▶ Repository ──▶ Service ──▶ API
 │  View ◀──estado─── ViewModel ◀── Repository ◀── Service ◀── API
 │                            │   │                               │
 └────────────────────────────┘   └───────────────────────────────┘
```

El flujo es en un solo sentido: los eventos suben y el estado baja.

| Pieza | Hace | No hace |
| --- | --- | --- |
| **View** (widget de pantalla) | Pinta el estado del ViewModel y le pasa los eventos del usuario. | No tiene lógica, ni llama a repositorios, ni decide la navegación más allá de "ir a X". |
| **ViewModel** (`ChangeNotifier`) | Guarda el estado de la pantalla, valida la entrada y expone `Command`s. Uno por pantalla. | No sabe de `BuildContext`, ni de widgets, ni de JSON. |
| **Repository** | Es la fuente de verdad de un tema (sesión, pedidos…). Convierte los DTO en modelos de dominio, cachea y reintenta. Devuelve `Result<T>`. | No pinta nada ni conoce rutas. |
| **Service** | Envuelve una sola cosa externa: un grupo de endpoints o el almacenamiento seguro. No tiene estado. | No decide nada: solo traduce llamadas. |

Reglas:

- **Las pantallas nunca ven un DTO.** El JSON de la API se lee en
  `data/services/api/models/` y el repositorio lo traduce a `domain/models/`.
  Es la regla de zod de la web, llevada a Dart.
- **El mensaje de error ya viene en español.** La API manda `message` listo
  para mostrar y un `error` con un código estable. El ViewModel decide con el
  código, nunca leyendo el texto.

---

## 3. Estructura de carpetas

```
lib/
├── main.dart                      # Arranque: lee el entorno, arma las dependencias y corre la app
├── app.dart                       # MaterialApp.router, tema y localización
├── config/
│   ├── env.dart                   # API_BASE_URL y demás, desde --dart-define
│   └── dependencies.dart          # Providers: services → repositories (prod y fake)
├── routing/
│   ├── routes.dart                # Constantes de rutas: '/login', '/stores', '/home'
│   └── router.dart                # GoRouter + redirect con la sesión
├── domain/
│   └── models/                    # User, Store, StoreRole, Session (freezed, sin JSON)
├── data/
│   ├── services/
│   │   ├── api/
│   │   │   ├── api_client.dart        # Dio + baseUrl + interceptor de sesión
│   │   │   ├── api_error.dart         # Lee { statusCode, message, error, details }
│   │   │   ├── auth_api.dart          # /auth/login, /refresh, /me, /logout, /switch-store
│   │   │   └── models/                # DTOs: LoginRequest, SessionResponse…
│   │   └── storage/
│   │       └── session_storage.dart   # Refresh token en Keychain / Keystore
│   └── repositories/
│       └── auth/
│           ├── auth_repository.dart          # abstract class (ChangeNotifier)
│           ├── auth_repository_remote.dart   # Contra la API
│           └── auth_repository_fake.dart     # En memoria: tests y demo sin API
├── ui/
│   ├── core/                      # Sistema de diseño (atomic design)
│   │   ├── tokens/                # Colores, tipografía, espacios, radios
│   │   ├── theme/                 # ThemeData claro/oscuro + ThemeExtension
│   │   ├── atoms/
│   │   ├── molecules/
│   │   ├── organisms/
│   │   ├── templates/             # Layouts de pantalla
│   │   └── l10n/                  # app_es.arb
│   ├── auth/
│   │   ├── login/
│   │   │   ├── view_models/login_view_model.dart
│   │   │   └── widgets/login_screen.dart
│   │   └── store_picker/          # Si la cuenta tiene varias tiendas
│   ├── splash/                    # Mientras se restaura la sesión
│   ├── panel/                     # Shell con la barra inferior + pestañas "pronto"
│   ├── summary/                   # Pestaña Resumen
│   └── more/                      # Pestaña Más: tienda, secciones y cerrar sesión
└── utils/
    ├── result.dart                # sealed class Result<T>
    └── command.dart               # Command0 / Command1<T, A>

test/                              # La misma estructura que lib/
testing/                           # Fakes y datos de prueba compartidos
config/                            # sim.json (API local), fake.json (sin API); prod.json no se versiona
assets/
├── fonts/                         # Inter Tight
└── brand/                         # Isotipo (logo.png de shopping-sas)
```

La organización es **por capa arriba y por tema abajo**, como en el ejemplo
Compass de Flutter. Con eso, `data/` se puede compartir entre pantallas sin
importar desde `ui/`.

---

## 4. Patrones

### MVVM

```dart
class LoginViewModel extends ChangeNotifier {
  LoginViewModel({required AuthRepository auth}) : _auth = auth {
    login = Command1<void, Credentials>(_login);
  }

  final AuthRepository _auth;
  late final Command1<void, Credentials> login;

  Future<Result<void>> _login(Credentials c) => _auth.login(c);
}
```

La View escucha `viewModel.login` con un `ListenableBuilder`: deshabilita el
botón mientras `running`, muestra `error` y navega cuando hay `completed`.

### Repository + Service

- El repositorio es una `abstract class` con dos implementaciones: `Remote` y
  `Fake`. `dependencies.dart` elige cuál según el entorno.
- `AuthRepository` además es `ChangeNotifier`: expone `isAuthenticated` y
  `GoRouter` lo usa como `refreshListenable`. Cuando la sesión cambia, el
  router redirige solo.

### Command

Envuelve una acción asíncrona y evita que se ejecute dos veces seguidas.
Equivale al `FormState` de la web y cumple la regla de deshabilitar el botón
mientras se envía.

### Result

```dart
sealed class Result<T> { const Result(); }
final class Ok<T> extends Result<T> { const Ok(this.value); final T value; }
final class Error<T> extends Result<T> { const Error(this.error); final AppError error; }
```

`AppError` lleva un `message` en español y un `code`, que se toma del campo
`error` de la API o se genera en la app: `network`, `timeout`, `unknown`.
Con `switch` sobre `Result`, el compilador obliga a manejar el error.

### Atomic design (sistema de diseño)

```
tokens → atoms → molecules → organisms → templates → screens
```

Cada nivel importa solo de los niveles inferiores. Las pantallas usan los
componentes de `ui/core/`. **No usan `ElevatedButton` ni `TextField` sueltos**
para lo que lleva marca: ese ajuste vive en los átomos, como la regla de
`atoms/` de la web.

---

## 5. Sistema de diseño

### Tokens (los de `.marketing` en `shopping-sas/src/app.css`)

| Token | Claro | Oscuro |
| --- | --- | --- |
| `background` | `#FFFFFF` | `#0E1A1C` (Pizarra) |
| `foreground` | `#0E1A1C` (Pizarra) | `#F6F4EF` (Lino) |
| `card` | `#FFFFFF` | `#1A2628` |
| `primary` | `#1E6F6B` (Teal Globin) | `#48A79C` (Teal Claro) |
| `primaryForeground` | `#FFFFFF` | `#0E1A1C` |
| `muted` | `#F1EEE7` (Lino) | `#1A2628` |
| `mutedForeground` | `#4A5251` (Grafito) | `#96A09E` |
| `border` / `input` | `#E4E0D7` | blanco 9 % / 12 % |
| `ring` | `#48A79C` | `#7FBDB4` |
| `destructive` | `#C0392B`* | `#E06C5A` |
| `success` | `#1E6F6B` | `#48A79C` |
| `caution` | `#C0662F` (Terracota) | `#C0662F` |

\* El `destructive` claro se toma de la paleta del panel. Hay que confirmarlo
contra el kit de marca.

Reglas que vienen del kit:

- **El teal es el único color que pide toque.** Los antetítulos no van en
  teal.
- Los botones van en **píldora y con peso 600**.
- Las tarjetas son muy redondeadas (`radius` 20).
- El tema es claro u oscuro según el sistema.

Los tokens van en una `ThemeExtension<GloberceColors>`. Así, cualquier widget
lee `context.colors.primary`, y el `ThemeData` de Material queda alineado para
lo que no se envuelve.

### Componentes para el login

| Nivel | Componente | Qué es |
| --- | --- | --- |
| atom | `GLogo` | Isotipo de Globerce (el PNG de 512 px, pintado a 44). |
| atom | `GButton` | Píldora, variantes `primary` / `ghost`, con estado `loading`. |
| atom | `GTextField` | Campo con los tokens del tema, autofill y `textInputAction`. |
| atom | `GLink` | Texto pulsable y subrayado. |
| molecule | `GPasswordField` | `GTextField` con el ojo para mostrar u ocultar, y una acción en la etiqueta ("¿La olvidaste?"). |
| molecule | `GFormField` | Etiqueta, acción opcional, campo y mensaje de error. |
| molecule | `GInlineMessage` | Mensaje de error o éxito debajo del formulario. |
| template | `AuthTemplate` | Isotipo, antetítulo, título, contenido y pie. Hace scroll, respeta el teclado y el área segura, y tiene un ancho máximo de 420. Es el equivalente de `AuthTemplate.svelte`. |

### Componentes del panel (fase 2)

| Nivel | Componente | Qué es |
| --- | --- | --- |
| molecule | `GStoreTile` | Una tienda: inicial, nombre y rol. En el selector y en "Más". |
| molecule | `GMenuRow` / `GMenuGroup` | Filas de menú agrupadas en una tarjeta con título. |
| molecule | `GEmptyState` | Icono, título y una línea sobre lino. |
| organism | `GBottomNav` | La barra inferior. La pestaña activa va en el color del texto con indicador lino, no en teal. |
| template | `PanelPageTemplate` | Título grande, subtítulo y contenido con scroll. Sin barra superior. |

Los ViewModels se crean con `ViewModelScope` (en `ui/core/utils/`), no
directo en el `builder` del router: `GoRouter` vuelve a llamar al `builder` en
cada refresco y la pantalla recibiría un ViewModel nuevo a mitad de una
acción.

---

## 6. Login (fase 1)

### Pantalla

```
┌─────────────────────────────┐
│                             │
│          [isotipo]          │
│          GLOBERCE           │  ← antetítulo, gris
│       Iniciar sesión        │  ← título
│                             │
│  Correo                     │
│  ┌───────────────────────┐  │
│  │ tu@correo.com         │  │
│  └───────────────────────┘  │
│  Contraseña  ¿La olvidaste? │
│  ┌───────────────────────┐  │
│  │ ••••••••          👁  │  │
│  └───────────────────────┘  │
│  Correo o contraseña        │  ← GInlineMessage (error)
│  incorrectos.               │
│  ┌───────────────────────┐  │
│  │        Entrar         │  │  ← píldora teal; "Entrando…" deshabilitado
│  └───────────────────────┘  │
│                             │
│   ¿No tienes tienda? Créala │  ← pie: abre la web
└─────────────────────────────┘
```

Textos iguales a los de la web: "Correo", "Contraseña", "¿La olvidaste?",
"Entrar", "Entrando…".

### Estados

| Caso | Respuesta de la API | Qué ve |
| --- | --- | --- |
| Enviando | — | Botón deshabilitado, "Entrando…", campos bloqueados |
| Datos malos | `401` | "Correo o contraseña incorrectos." (el `message` de la API) |
| Cuenta bloqueada | `403` | El mensaje de bloqueo de la API |
| Demasiados intentos | `429` | "Espera un momento antes de intentar de nuevo." |
| Sin conexión / timeout | — | "No hay conexión. Revisa tu internet e intenta de nuevo." |
| Una tienda | `200` | Entra al panel |
| Varias tiendas | `200` | Selector de tienda, que llama a `/auth/switch-store` |
| Ninguna tienda | `200`, `activeStoreId: null` | "Tu cuenta no tiene tiendas todavía." |

En la app solo se valida el formato del correo y que la contraseña no esté
vacía. **No se validan las reglas de la contraseña**, igual que en la API.

### Detalles

- `AutofillGroup` con `AutofillHints.email` / `password`, para que funcione el
  llavero de iOS y el gestor de contraseñas de Android.
- El teclado del correo es `TextInputType.emailAddress`. "Siguiente" pasa a
  la contraseña y "Listo" envía.
- Funciona con el texto grande de accesibilidad y en modo oscuro.
- "¿La olvidaste?" y "Créala" abren la web (`url_launcher`) en la fase 1. Las
  pantallas nativas vienen después.

### Sesión

| Momento | Qué pasa |
| --- | --- |
| Login | El `accessToken` (15 min) queda **en memoria** y el `refreshToken` (30 días) va a **Keychain / Keystore**. |
| Arranque | Splash. Si hay un refresh token guardado, se llama a `/auth/refresh`: si responde `200`, entra al panel; si responde `401`, va al login. |
| `401` en una petición | El interceptor refresca **una sola vez** (single-flight), reintenta la petición original y, si vuelve a fallar, cierra la sesión. |
| Logout | `POST /auth/logout` y se borra el almacenamiento seguro. |

**Cuidado con la rotación.** La API rota el refresh token en cada uso. Si
alguien presenta uno ya usado fuera de una ventana de 30 s, la API **revoca
todas las sesiones de la cuenta** (`ROTATION_GRACE_MS` en
`token.service.ts`). Por eso:

1. Nunca hay dos refresh en paralelo: el `QueuedInterceptor` los encola.
2. El token nuevo se guarda en Keychain **antes** de soltar las peticiones
   que esperan.
3. En iOS, el Keychain sobrevive a desinstalar la app. En el primer arranque
   (con una bandera en `SharedPreferences`) se borra lo que haya quedado.

### URL de la API por entorno

| Dónde corre | `API_BASE_URL` |
| --- | --- |
| Simulador iOS | `http://localhost:3000/v1` |
| Emulador Android | `http://10.0.2.2:3000/v1` |
| Teléfono físico | `http://<IP-del-Mac-en-la-red>:3000/v1` |
| Producción | `https://api.globerce.store/v1` (por confirmar) |

iOS bloquea `http` por defecto. En desarrollo se permite solo con
`NSAllowsLocalNetworking`, y nunca con `NSAllowsArbitraryLoads`.

---

## 7. Fases

**Fase 0 — Fundaciones**
- [x] `git init`, `.gitignore`, `analysis_options.yaml` estricto.
- [x] Dependencias: `provider`, `go_router`, `dio`, `freezed`, `json_serializable`, `flutter_secure_storage`, `shared_preferences`, `url_launcher`, `lucide_icons_flutter`.
- [x] Estructura de carpetas, `Result`, `Command`, `env.dart`, `config/*.json`.
- [x] Tokens, tema claro/oscuro, Inter Tight y el isotipo.
- [x] `gen-l10n` con `app_es.arb`.
- [x] Router con `/` (arranque), `/login`, `/stores` y `/home`.
- [x] Nombre visible "Globerce" (iOS y Android).
- [x] Icono de la app y pantalla de lanzamiento (salen del isotipo de 512 px; regenerar cuando llegue la marca en vector).

**Fase 1 — Login**
- [x] Átomos, moléculas y `AuthTemplate` (§5).
- [x] `AuthApi`, `SessionStorage`, `ApiClient` con el interceptor.
- [x] `AuthRepository` (remoto y fake).
- [x] `LoginViewModel` + `LoginScreen`, con todos los estados de §6.
- [x] Splash con restauración de sesión, selector de tienda y un home de prueba con "Cerrar sesión".
- [x] Tests: ViewModel con el fake, flujo completo de login con widgets, y rotación single-flight en el repositorio.
- [x] Test del interceptor HTTP (reintento después de un `401`).
- [x] Probado en el simulador contra el fake (`config/fake.json`).
- [ ] Probado en el simulador contra la API local (`config/sim.json`). Este Mac no tiene Docker ni Postgres para levantar `ecommerce-api`.

**Fase 2 — Shell del panel**
- [x] Barra inferior con el orden de `admin-nav.ts` de la web: Resumen, Pedidos, Productos, Inventario y Más.
- [x] Cada pestaña guarda su pila (`StatefulShellRoute.indexedStack`); tocar la activa vuelve a su raíz.
- [x] Resumen: saludo, tienda activa y el lugar de las cifras del día.
- [x] Pedidos, Productos e Inventario: estado "muy pronto" con enlace a la misma sección del panel web.
- [x] Más: tienda activa (toca para cambiar si hay varias), grupos "Tienda" y "Cuenta" con enlaces al panel web, y cerrar sesión. Dominio solo para la dueña, como en la web.
- [ ] Contadores en la barra (pedidos pendientes, soporte sin leer), cuando exista su endpoint en la app.

**Fase 3 — Pedidos y resumen**
- [x] `OrdersApi` (`/stores/:storeId/dashboard` y `/orders`) y `OrdersRepository` (remoto y fake). El repositorio avisa cuando cambia un pedido o la tienda activa, y las pantallas que lo escuchan recargan solas.
- [x] Un estado que la app no conoce vuelve como respuesta inválida, no como pantalla rota.
- [x] Resumen con las cifras de `DashboardDto`: por responder (y cuántos llevan más de un día), ventas del mes, lo que se está acabando y los avisos de reposición.
- [x] Lista de pedidos: búsqueda por número o nombre, filtro por estado, "ver más" de 20 en 20 y arrastrar para recargar. El último filtro gana aunque cambie mientras carga.
- [x] Detalle: líneas y totales, clienta, escribirle por WhatsApp, cambio de estado y nota interna. Cancelar pide confirmación y un pedido cancelado no ofrece reabrirse (la API responde `409`).
- [x] Componentes nuevos: `GBadge`, `GBackLink`, `GSection`, `GStatTile`, `GFilterChips`, `GSelectRow`, `showConfirmSheet` y la variante `destructive` de `GButton`.
- [x] Tests: repositorio remoto con un adaptador HTTP falso, ViewModels de lista, detalle y resumen, y el flujo con widgets.
- [x] Probado en el simulador contra el fake.
- [ ] Probado contra la API local.

**Fase 4 en adelante**: notificaciones push de pedidos nuevos, contadores en
la barra, productos (con fotos desde la cámara) e inventario. Por definir.

---

## 8. Puertas de calidad

Antes de dar algo por terminado tiene que pasar todo esto:

```bash
dart format --set-exit-if-changed .
flutter analyze            # 0 issues
flutter test
flutter build ios --simulator --debug
```

---

## 9. Pendientes por decidir

1. **Android desde ya o solo iOS.** El proyecto ya tiene las dos
   plataformas; la propuesta es probar Android a partir de la fase 1.
2. **Bundle id definitivo.** El actual es `store.globerce.globerceApp`; la
   propuesta es `store.globerce.app`. Conviene cambiarlo antes de publicar.
3. **iPhone físico.** El teléfono tiene iOS 27 y este Mac Intel tiene Xcode
   26.5. Hay que confirmar si puede instalar apps en el teléfono.
4. **URL de producción de la API.**
5. **`destructive` en claro:** confirmarlo contra el kit de marca.
6. **Marca en vector (SVG o PDF).** El icono de la app sale del isotipo de
   512 px escalado a 1024; con el vector queda nítido en la App Store.
7. **Sesión del panel web.** Las secciones que todavía abren la web piden
   entrar otra vez allá: la sesión de la app no viaja al navegador.
