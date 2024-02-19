import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/core/exception/base_exception.dart';
import 'package:resto_admin/features/orders/domain/repository/order_repository.dart';

class UpdateTypeUsecase {
  final OrderRepository repository;
  UpdateTypeUsecase({required this.repository});
  Future<void> call(String orderId, OrderType newType) {
    try {
      return repository.updateOrderType(orderId, newType);
    } catch (e) {
      throw BaseException("cannot get");
    }
  }
}
