import 'package:resto_admin/features/coupons/domain/entities/coupon_entity.dart';

abstract class CouponRepository {
  Future<void> addCoupon(CouponEntity couponEntity);
}
