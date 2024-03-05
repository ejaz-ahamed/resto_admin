import 'package:resto_admin/features/coupons/data/models/coupon_model.dart';

abstract class CouponFirestoreDatasource {
  Future<void> add(CouponModel couponModel);
  Stream<List<CouponModel>> getAllCoupons();
}
