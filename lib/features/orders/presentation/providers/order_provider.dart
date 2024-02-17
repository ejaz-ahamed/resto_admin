import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/features/orders/data/repository/order_repository_impl.dart';
import 'package:resto_admin/features/orders/domain/repository/order_repository.dart';
import 'package:resto_admin/features/orders/domain/usecase/order_usecase.dart';
import 'package:resto_admin/features/orders/presentation/providers/order_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'order_provider.g.dart';

@riverpod
class OrderProvider extends _$OrderProvider {
  late OrderRepository repository;
  @override
  OrderproviderState build() {
    return OrderproviderState(
      orders: GetOrderUsecase(repository: ref.watch(orderRepositoryProvider))(
          OrderType.order),
      orderType: OrderType.order,
    );
  }

  void changeTab(OrderType selectedOrder) {
    final ordersStream = GetOrderUsecase(
        repository: ref.watch(orderRepositoryProvider))(selectedOrder);
    state = state.copyWith(orderType: selectedOrder, orders: ordersStream);
  }

  // Stream<List<OrderEntity>> getOrder() async* {

  //   await for (final orders in ordersStream) {
  //     state = state.copyWith(orders: orders);
  //     yield orders;
  //   }
  // }
}
