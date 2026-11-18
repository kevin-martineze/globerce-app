import 'package:flutter_test/flutter_test.dart';
import 'package:globerce_app/data/repositories/auth/auth_repository_fake.dart';
import 'package:globerce_app/ui/more/more_links.dart';
import 'package:globerce_app/ui/more/view_models/more_view_model.dart';

Future<MoreViewModel> _signedInAs(String email) async {
  final auth = AuthRepositoryFake(latency: Duration.zero);
  await auth.login(email: email, password: AuthRepositoryFake.demoPassword);
  return MoreViewModel(auth: auth);
}

void main() {
  test('la dueña ve Dominio y puede cambiar de tienda', () async {
    final vm = await _signedInAs('duena@globerce.test');

    final ids = vm.linksFor(MoreGroup.store).map((link) => link.id);
    expect(ids, contains(MoreLinkId.domain));
    expect(vm.canSwitchStore, isTrue);
  });

  test(
    'el equipo no ve Dominio y, con una tienda, no cambia de tienda',
    () async {
      final vm = await _signedInAs('equipo@globerce.test');

      final ids = vm.linksFor(MoreGroup.store).map((link) => link.id);
      expect(ids, isNot(contains(MoreLinkId.domain)));
      expect(ids, contains(MoreLinkId.coupons));
      expect(vm.canSwitchStore, isFalse);
    },
  );

  test('los grupos no se mezclan', () async {
    final vm = await _signedInAs('duena@globerce.test');

    expect(vm.linksFor(MoreGroup.account).map((link) => link.id), [
      MoreLinkId.support,
      MoreLinkId.settings,
      MoreLinkId.team,
      MoreLinkId.payments,
      MoreLinkId.plan,
      MoreLinkId.account,
    ]);
  });
}
