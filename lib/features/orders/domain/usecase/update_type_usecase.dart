import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/orders/domain/repository/order_repository.dart';

class UpdateTypeUsecase {
  final OrderRepository repository;
  UpdateTypeUsecase({required this.repository});
  Future<void> call(String orderId, OrderStatus newStatus) {
    try {
      return repository.updateOrderType(orderId, newStatus);
    } catch (e) {
      throw BaseException("cannot get");
    }
  }
}
