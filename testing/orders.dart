import 'package:globerce_app/data/repositories/auth/auth_repository_fake.dart';
import 'package:globerce_app/data/repositories/orders/orders_repository_fake.dart';

/// Un "ahora" fijo: los pedidos demo se fechan contra él.
final testNow = DateTime(2026, 11, 17, 12);

/// La sesión de [email] ya abierta, en la tienda [storeId], y sus pedidos
/// demo sin espera.
Future<(AuthRepositoryFake, OrdersRepositoryFake)> signedInWithOrders({
  String email = 'duena@globerce.test',
  String storeId = 's-lino',
}) async {
  final auth = AuthRepositoryFake(latency: Duration.zero);
  await auth.login(email: email, password: AuthRepositoryFake.demoPassword);
  if (auth.session?.activeStoreId != storeId) await auth.selectStore(storeId);

  final orders = OrdersRepositoryFake(
    auth: auth,
    latency: Duration.zero,
    now: () => testNow,
  );
  return (auth, orders);
}
