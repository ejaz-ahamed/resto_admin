import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/coupons/domain/repository/coupon_repository.dart';

final class DeleteCouponUseCase {
  final CouponRepository repository;
  DeleteCouponUseCase({required this.repository});
  Future<void> call(String id) async {
    try {
      return repository.deleteCoupon(id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
