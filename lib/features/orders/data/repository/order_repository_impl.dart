import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/features/orders/data/datasource/order_datasource.dart';
import 'package:resto_admin/features/orders/data/datasource/order_datasource_impl.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/domain/entity/order_item_entity.dart';
import 'package:resto_admin/features/orders/domain/repository/order_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'order_repository_impl.g.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderFirestoreDataSource dataSource;
  OrderRepositoryImpl({required this.dataSource});

  @override
  Stream<List<OrderEntity>> getOrderByType(OrderStatus orderStatus) async* {
    final orders = dataSource.getAll(orderStatus);
    await for (final doc in orders) {
      yield [
        for (final data in doc)
          OrderEntity(
            uid: data.uid,
            location: data.location,
            time: data.time,
            items: [
              for (final orderItem in data.items)
                OrderItemEntity(
                  productId: orderItem.productId,
                  type: orderItem.type,
                  quantity: orderItem.quantity,
                ),
            ],
            orderStatus: orderStatus,
            name: data.name,
          ),
      ];
    }
  }

  @override
  Future<void> updateOrderType(String orderId, OrderStatus newType) async {
    await dataSource.updateType(orderId, newType);
  }
}

@riverpod
OrderRepository orderRepository(OrderRepositoryRef ref) {
  return OrderRepositoryImpl(
      dataSource: ref.watch(orderFirestoreDataSourceProvider));
}
