import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/features/orders/data/repository/order_repository_impl.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
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
    return OrderproviderState(orders: null, orderType: OrderType.order);
  }

  Stream<List<OrderEntity>> getOrder() async* {
    final ordersStream = GetOrderUsecase(
        repository: ref.watch(orderRepositoryProvider))(state.orderType);

    await for (final orders in ordersStream) {
      state = state.copyWith(orders: orders);
      yield orders;
    }
  }
}
