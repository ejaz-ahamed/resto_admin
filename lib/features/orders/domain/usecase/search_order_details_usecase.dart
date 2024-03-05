import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/core/utils/firebase_storage_utils.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/domain/repository/order_repository.dart';

class SearchOrderUsecase {
  final OrderRepository repository;
  SearchOrderUsecase({
    required this.repository,
  });
  Future<List<OrderEntity>> call(
      String keyword, OrderStatus orderStatus) async {
    try {
      final allOrders = await repository.search(orderStatus);
      final List<OrderEntity> searchResult = [];

      for (final order in allOrders) {
        final OrderEntity orderAfterImagePathUpdate;
        if (order.user.imgPath.trim().isNotEmpty) {
          orderAfterImagePathUpdate = order.copyWith(
            user: order.user.copyWith(
              imgPath:
                  await FirebaseStorageUtils.getDownloadUrl(order.user.imgPath),
            ),
          );
        } else {
          orderAfterImagePathUpdate = order;
        }

        keyword = keyword.toLowerCase().trim();
        if (order.location.toLowerCase().trim().contains(keyword) ||
            order.user.uid.toLowerCase().trim().contains(keyword) ||
            order.user.name.toLowerCase().trim().contains(keyword) ||
            order.id.toLowerCase().trim().contains(keyword)) {
          searchResult.add(orderAfterImagePathUpdate);
        }
      }
      return searchResult;
    } catch (e) {
      throw BaseException('Cannot get orders');
    }
  }
}
