import 'package:globerce_app/config/env.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository_fake.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository_remote.dart';
import 'package:globerce_app/data/services/api/api_client.dart';
import 'package:globerce_app/data/services/api/auth_api.dart';
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
  ];
}

/// Todo en memoria. Para correr la app sin API y para los tests de widgets.
List<SingleChildWidget> fakeProviders({AuthRepository? auth}) {
  return [
    ChangeNotifierProvider<AuthRepository>(
      create: (_) => auth ?? AuthRepositoryFake(),
    ),
  ];
}
