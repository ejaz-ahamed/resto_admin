import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/domain/repository/order_repository.dart';

class GetOrderUsecase {
  final OrderRepository repository;

  GetOrderUsecase({required this.repository});
  Stream<List<OrderEntity>> call(OrderType orderType) {
    try {
      return repository.getOrderByType(orderType);
    } catch (e) {
      throw BaseException("cannot get");
    }
  }
}
