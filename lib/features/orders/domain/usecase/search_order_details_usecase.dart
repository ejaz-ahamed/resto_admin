import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/core/exception/base_exception.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/domain/entity/order_item_entity.dart';
import 'package:resto_admin/features/orders/domain/repository/order_repository.dart';

class SearchOrderUsecase {
  final OrderRepository repository;
  SearchOrderUsecase({
    required this.repository,
  });
  Future<List<OrderEntity>> call(
      String keyword, OrderStatus orderStatus) async {
    try {
      final allOrders = await repository.serach(orderStatus);
      final List<OrderEntity> searchResult = [];
      for (final order in allOrders) {
        final orderEntity = OrderEntity(
          uid: order.uid,
          location: order.location,
          time: order.time,
          name: order.name,
          items: [
            for (final item in order.items)
              OrderItemEntity(
                productId: item.productId,
                type: item.type,
                quantity: item.quantity,
              ),
          ],
          orderStatus: orderStatus,
        );
        keyword = keyword.toLowerCase().trim();
        if (order.name.toLowerCase().trim().contains(keyword) ||
            order.location.toLowerCase().trim().contains(keyword) ||
            order.uid.toLowerCase().trim().contains(keyword)) {
          searchResult.add(orderEntity);
        }
      }
      return searchResult;
    } catch (e) {
      throw BaseException('Cannot search');
    }
  }
}
