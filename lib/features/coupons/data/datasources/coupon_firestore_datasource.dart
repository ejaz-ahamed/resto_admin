import 'package:resto_admin/features/coupons/data/models/coupon_model.dart';

abstract class CouponFirestoreDatasource {
  Future<void> add(CouponModel couponModel);
  Stream<List<CouponModel>> getAllCoupons();
  Future<void> update(CouponModel updatedModel ,String id);
  Future<void> delete(String couponId);
}
