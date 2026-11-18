import 'package:flutter/widgets.dart';

/// Crea el ViewModel de una pantalla una sola vez y lo libera al salir.
///
/// `GoRouter` vuelve a llamar al `builder` de una ruta cada vez que el router
/// se refresca —por ejemplo, cuando cambia la sesión—. Si el ViewModel se
/// creara ahí mismo, la pantalla recibiría uno nuevo a mitad de una acción y
/// perdería su estado. Este widget lo guarda en su `State`, que sí sobrevive a
/// esos refrescos.
class ViewModelScope<T extends ChangeNotifier> extends StatefulWidget {
  const ViewModelScope({
    super.key,
    required this.create,
    required this.builder,
  });

  final T Function(BuildContext context) create;
  final Widget Function(BuildContext context, T viewModel) builder;

  @override
  State<ViewModelScope<T>> createState() => _ViewModelScopeState<T>();
}

class _ViewModelScopeState<T extends ChangeNotifier>
    extends State<ViewModelScope<T>> {
  late final T _viewModel = widget.create(context);

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _viewModel);
}
