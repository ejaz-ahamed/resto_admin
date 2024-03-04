import 'package:resto_admin/features/coupons/data/datasources/coupon_firestore_datasource.dart';
import 'package:resto_admin/features/coupons/data/datasources/coupon_firestore_datasource_impl.dart';
import 'package:resto_admin/features/coupons/data/models/coupon_model.dart';
import 'package:resto_admin/features/coupons/domain/entities/coupon_entity.dart';
import 'package:resto_admin/features/coupons/domain/repository/coupon_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coupon_repository_impl.g.dart';

class CouponRepositoryImpl extends CouponRepository {
  final CouponFirestoreDatasource datasource;

  CouponRepositoryImpl({required this.datasource});
  @override
  Future<void> addCoupon(CouponEntity couponEntity) async {
    final couponAdd = CouponModel(
      id: couponEntity.id,
      title: couponEntity.title,
      couponType: couponEntity.couponType,
      percentageOrAmount: couponEntity.percentageOrAmount,
      count: couponEntity.count,
      check: couponEntity.equal,
      value: couponEntity.value,
      logic: couponEntity.andOr,
      code: couponEntity.code!,
    );
    await datasource.add(couponAdd);
  }
}

@riverpod
CouponRepository couponRepository(CouponRepositoryRef ref) {
  return CouponRepositoryImpl(
      datasource: ref.watch(couponFirestoreDatasourceProvider));
}
