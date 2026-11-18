import 'package:flutter/foundation.dart';

import 'package:globerce_app/data/repositories/orders/orders_repository.dart';
import 'package:globerce_app/domain/models/order.dart';
import 'package:globerce_app/utils/command.dart';
import 'package:globerce_app/utils/result.dart';

/// La lista de pedidos: filtro por estado, búsqueda y "ver más".
///
/// Se recarga sola cuando el repositorio avisa: un pedido cambió en su
/// detalle, o se cambió de tienda.
class OrdersViewModel extends ChangeNotifier {
  OrdersViewModel({required this._orders}) {
    load = Command0(_loadFirstPage)..execute();
    loadMore = Command0(_loadNextPage);
    _orders.addListener(_reload);
  }

  final OrdersRepository _orders;

  /// Carga la primera página con el filtro y la búsqueda actuales.
  late final Command0<OrderPage> load;

  /// Agrega la página siguiente al final de la lista.
  late final Command0<OrderPage> loadMore;

  OrderStatus? _status;
  String _query = '';
  List<Order> _list = const [];
  OrderPage? _lastPage;

  /// El estado que se está filtrando, o null para ver todos.
  OrderStatus? get status => _status;
  String get query => _query;
  List<Order> get orders => _list;

  /// Pedidos que cumplen el filtro, en todas las páginas. Null hasta que
  /// llega la primera.
  int? get total => _lastPage?.total;

  bool get hasMore => _lastPage?.hasMore ?? false;

  /// Hay filtro o búsqueda: el vacío dice "nada con ese filtro" y no
  /// "todavía no hay pedidos".
  bool get isFiltered => _status != null || _query.isNotEmpty;

  void selectStatus(OrderStatus? status) {
    if (status == _status) return;
    _status = status;
    notifyListeners();
    load.execute();
  }

  void search(String query) {
    final trimmed = query.trim();
    if (trimmed == _query) return;
    _query = trimmed;
    notifyListeners();
    load.execute();
  }

  /// Para "arrastra para recargar".
  Future<void> refresh() => load.execute();

  Future<Result<OrderPage>> _loadFirstPage() async {
    while (true) {
      final status = _status;
      final query = _query;
      final result = await _orders.list(status: status, query: query);

      // El filtro cambió mientras cargaba: esa respuesta ya no sirve. Como el
      // comando ignora una segunda ejecución, se vuelve a pedir aquí mismo.
      if (status != _status || query != _query) continue;

      if (result case Ok(value: final page)) {
        _list = page.orders;
        _lastPage = page;
      }
      return result;
    }
  }

  Future<Result<OrderPage>> _loadNextPage() async {
    final current = _lastPage;
    // Sin página cargada, o ya en la última: no hay nada que pedir.
    if (current == null || !current.hasMore || load.running) {
      return Result.ok(current ?? _emptyPage);
    }

    final status = _status;
    final query = _query;
    final result = await _orders.list(
      status: status,
      query: query,
      page: current.page + 1,
    );

    // Si mientras tanto cambió el filtro o se recargó, la página ya no encaja.
    final stillValid =
        status == _status && query == _query && _lastPage == current;
    if (result case Ok(value: final page) when stillValid) {
      _list = [..._list, ...page.orders];
      _lastPage = page;
    }
    return result;
  }

  void _reload() => load.execute();

  static const _emptyPage = OrderPage(
    orders: [],
    total: 0,
    page: 1,
    pageCount: 1,
  );

  @override
  void dispose() {
    _orders.removeListener(_reload);
    load.dispose();
    loadMore.dispose();
    super.dispose();
  }
}
