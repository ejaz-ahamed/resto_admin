import 'package:resto_admin/core/enums/coupon_type.dart';
import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/coupons/domain/entities/condition_entity.dart';
import 'package:resto_admin/features/coupons/domain/entities/coupon_entity.dart';
import 'package:resto_admin/features/coupons/domain/repository/coupon_repository.dart';

final class AddCouponUsecase {
  final CouponRepository repository;

  AddCouponUsecase({required this.repository});

  Future<void> call({
    required String? title,
    required String code,
    required CouponType couponType,
    required double percentageOrAmount,
    required List<ConditionEntity> conditions,
  }) async {
    try {
      return await repository.addCoupon(CouponEntity(
        id: null,
        title: title,
        couponType: couponType,
        percentageOrAmount: percentageOrAmount,
        code: code,
        condition: conditions,
      ));
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
