import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/core/utils/firebase_storage_utils.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/domain/repository/order_repository.dart';

class GetOrderUsecase {
  final OrderRepository repository;

  GetOrderUsecase({required this.repository});
  Stream<List<OrderEntity>> call(OrderStatus orderStatus) async* {
    try {
      final ordersStream = repository.getOrderByType(orderStatus);

      await for (final orders in ordersStream) {
        final ordersAfterConversion = <OrderEntity>[];

        for (final order in orders) {
          final OrderEntity orderAfterImagePathUpdate;

          /// Update the image path with the download URL
          if (order.user.imgPath.trim().isNotEmpty) {
            orderAfterImagePathUpdate = order.copyWith(
              user: order.user.copyWith(
                imgPath: await FirebaseStorageUtils.getDownloadUrl(
                    order.user.imgPath),
              ),
            );
          } else {
            orderAfterImagePathUpdate = order;
          }

          ordersAfterConversion.add(orderAfterImagePathUpdate);
        }

        yield ordersAfterConversion;
      }
    } catch (e) {
      throw BaseException("Cannot get orders");
    }
  }
}
