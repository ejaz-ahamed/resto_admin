import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';

abstract class OrderRepository {
  Stream<List<OrderEntity>> getOrderByType(OrderStatus orderStatus);
  Future<void> updateOrderType(String orderId, OrderStatus newStatus);
}
