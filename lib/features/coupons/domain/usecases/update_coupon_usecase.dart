import 'package:resto_admin/core/enums/coupon_type.dart';
import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/coupons/domain/entities/condition_entity.dart';
import 'package:resto_admin/features/coupons/domain/entities/coupon_entity.dart';
import 'package:resto_admin/features/coupons/domain/repository/coupon_repository.dart';

final class UpdateCouponUsecase {
  final CouponRepository repository;
  UpdateCouponUsecase({required this.repository});

  Future<void> call({
    required String? id,
    required String? title,
    required String code,
    required CouponType couponType,
    required double percentageOrAmount,
    required List<ConditionEntity> conditions,
  }) async {
    try {
      return await repository.updateCoupon(
        CouponEntity(
          id: id,
          title: title,
          couponType: couponType,
          percentageOrAmount: percentageOrAmount,
          code: code,
          condition: conditions,
        ),
        id!,
      );
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
