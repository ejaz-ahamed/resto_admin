import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/features/orders/data/model/order_model.dart';

abstract class OrderFirestoreDataSource {
  Stream<List<OrderModel>> getAll(OrderStatus orderStatus);
  Future<void> updateType(String orderId, OrderStatus newStatus);
  Future<List<OrderModel>> search(OrderStatus orderStatus);
}
