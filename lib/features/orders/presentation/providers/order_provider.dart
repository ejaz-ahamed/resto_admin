import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/features/orders/data/repository/order_repository_impl.dart';
import 'package:resto_admin/features/orders/domain/repository/order_repository.dart';
import 'package:resto_admin/features/orders/domain/usecase/get_order_usecase.dart';
import 'package:resto_admin/features/orders/domain/usecase/get_products_by_id_usecase.dart';
import 'package:resto_admin/features/orders/domain/usecase/update_type_usecase.dart';
import 'package:resto_admin/features/orders/presentation/providers/order_state_provider.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'order_provider.g.dart';

@riverpod
class Order extends _$Order {
  late OrderRepository repository;
  @override
  OrderproviderState build() {
    // final results=Future.wait([]);
    return OrderproviderState(
      orders: GetOrderUsecase(repository: ref.watch(orderRepositoryProvider))(
          OrderStatus.order),
      orderStatus: OrderStatus.order,
    );
  }

  void changeTab(OrderStatus selectedOrder) {
    final ordersStream = GetOrderUsecase(
        repository: ref.watch(orderRepositoryProvider))(selectedOrder);
    state = state.copyWith(orderStatus: selectedOrder, orders: ordersStream);
  }

  Future<void> updateOrderType(String orderId, OrderStatus newStatus) {
    return UpdateTypeUsecase(repository: ref.watch(orderRepositoryProvider))(
        orderId, newStatus);
  }

  Stream<ProductEntity> getProductById(String productId) async*{
    yield* GetProductByIdUsecase(repository: ref.watch(orderRepositoryProvider))(
        productId);
  }
}
