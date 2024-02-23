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
            id: data.id,
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
          ),
      ];
    }
  }

  @override
  Future<void> updateOrderType(String orderId, OrderStatus newType) async {
    await dataSource.updateType(orderId, newType);
  }

  @override
  Future<List<OrderEntity>> serach(OrderStatus orderStatus) async {
    final orders = await dataSource.search(orderStatus);
    final result = [
      for (final data in orders)
        OrderEntity(
          id: data.id,
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
        ),
    ];
    return result;
  }
}

@riverpod
OrderRepository orderRepository(OrderRepositoryRef ref) {
  return OrderRepositoryImpl(
      dataSource: ref.watch(orderFirestoreDataSourceProvider));
}
