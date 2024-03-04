import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_admin/features/coupons/data/datasources/coupon_firestore_datasource.dart';
import 'package:resto_admin/features/coupons/data/models/coupon_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coupon_firestore_datasource_impl.g.dart';

class CouponFirestoreDatasourceImpl extends CouponFirestoreDatasource {
  final collection = FirebaseFirestore.instance
      .collection("coupons")
      .withConverter(
          fromFirestore: CouponModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());
  @override
  Future<void> add(CouponModel couponModel) async {
    await collection.doc().set(couponModel);
  }
}

@riverpod
CouponFirestoreDatasource couponFirestoreDatasource(
    CouponFirestoreDatasourceRef ref) {
  return CouponFirestoreDatasourceImpl();
}
