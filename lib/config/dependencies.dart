import 'package:globerce_app/config/env.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository_fake.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository_remote.dart';
import 'package:globerce_app/data/repositories/orders/orders_repository.dart';
import 'package:globerce_app/data/repositories/orders/orders_repository_fake.dart';
import 'package:globerce_app/data/repositories/orders/orders_repository_remote.dart';
import 'package:globerce_app/data/services/api/api_client.dart';
import 'package:globerce_app/data/services/api/auth_api.dart';
import 'package:globerce_app/data/services/api/orders_api.dart';
import 'package:globerce_app/data/services/storage/session_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Las dependencias de la app: services → repositories.
///
/// Las pantallas solo ven repositorios, y por su tipo abstracto. Cambiar la
/// API por el fake (`USE_FAKE_API`) no toca ninguna pantalla.
List<SingleChildWidget> appProviders() {
  if (Env.useFakeApi) return fakeProviders();

  return [
    Provider<ApiClient>(create: (_) => ApiClient(baseUrl: Env.apiBaseUrl)),
    Provider<AuthApi>(create: (context) => AuthApi(context.read())),
    Provider<OrdersApi>(create: (context) => OrdersApi(context.read())),
    Provider<SessionStorage>(create: (_) => SecureSessionStorage()),
    ChangeNotifierProvider<AuthRepository>(
      create: (context) {
        final repository = AuthRepositoryRemote(
          api: context.read(),
          storage: context.read(),
        );
        // El cliente HTTP pide los tokens al repositorio, que a su vez usa el
        // cliente. Se conectan aquí para no tener un ciclo en los constructores.
        context.read<ApiClient>().sessionTokens = repository;
        return repository;
      },
    ),
    ChangeNotifierProvider<OrdersRepository>(
      create: (context) =>
          OrdersRepositoryRemote(api: context.read(), auth: context.read()),
    ),
  ];
}

/// Todo en memoria. Para correr la app sin API y para los tests de widgets.
///
/// [orders] recibe la sesión para que el test pueda armar el repositorio con
/// la misma instancia que usa la app.
List<SingleChildWidget> fakeProviders({
  AuthRepository? auth,
  OrdersRepository Function(AuthRepository auth)? orders,
}) {
  return [
    ChangeNotifierProvider<AuthRepository>(
      create: (_) => auth ?? AuthRepositoryFake(),
    ),
    ChangeNotifierProvider<OrdersRepository>(
      create: (context) {
        final session = context.read<AuthRepository>();
        return orders?.call(session) ?? OrdersRepositoryFake(auth: session);
      },
    ),
  ];
}
