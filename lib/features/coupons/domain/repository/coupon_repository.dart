import 'package:resto_admin/features/coupons/domain/entities/coupon_entity.dart';

abstract class CouponRepository {
  Future<void> addCoupon(CouponEntity couponEntity);
  Stream<List<CouponEntity>> getAll();
  Future<void> updateCoupon(CouponEntity entity, String id);
  Future<void> deleteCoupon(String id);
}
