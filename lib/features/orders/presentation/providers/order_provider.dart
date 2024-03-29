import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/features/orders/data/repository/order_repository_impl.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/domain/usecase/get_order_usecase.dart';
import 'package:resto_admin/features/orders/domain/usecase/search_order_details_usecase.dart';
import 'package:resto_admin/features/orders/domain/usecase/update_type_usecase.dart';
import 'package:resto_admin/features/orders/presentation/providers/order_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'order_provider.g.dart';

@riverpod
class Order extends _$Order {
  @override
  OrderproviderState build() {
    return OrderproviderState(
      orderStatus: OrderStatus.order,
      searchOrder: null,
    );
  }

  void clearSearchList() {
    state = state.copyWith(searchOrder: null);
  }

  void changeTab(OrderStatus selectedOrder) {
    state = state.copyWith(orderStatus: selectedOrder);
  }

  Future<void> updateOrderType(String orderId, OrderStatus newStatus) {
    return UpdateTypeUsecase(repository: ref.watch(orderRepositoryProvider))(
        orderId, newStatus);
  }

  void search(String keyword) async {
    final searchOrders = await SearchOrderUsecase(
        repository: ref.watch(orderRepositoryProvider))(
      keyword,
      state.orderStatus,
    );
    state = state.copyWith(searchOrder: searchOrders);
  }

  /// Get the products
}

@riverpod
Stream<List<OrderEntity>> getOrders(GetOrdersRef ref, OrderStatus status) {
  final repo = ref.read(orderRepositoryProvider);
  return GetOrderUsecase(repository: repo)(status);
}
