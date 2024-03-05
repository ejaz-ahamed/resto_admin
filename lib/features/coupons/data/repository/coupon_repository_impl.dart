import 'package:resto_admin/features/coupons/data/datasources/coupon_firestore_datasource.dart';
import 'package:resto_admin/features/coupons/data/datasources/coupon_firestore_datasource_impl.dart';
import 'package:resto_admin/features/coupons/data/models/condition_model.dart';
import 'package:resto_admin/features/coupons/data/models/coupon_model.dart';
import 'package:resto_admin/features/coupons/domain/entities/condition_entity.dart';
import 'package:resto_admin/features/coupons/domain/entities/coupon_entity.dart';
import 'package:resto_admin/features/coupons/domain/repository/coupon_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coupon_repository_impl.g.dart';

class CouponRepositoryImpl extends CouponRepository {
  final CouponFirestoreDatasource datasource;

  CouponRepositoryImpl({required this.datasource});
  @override
  Future<void> addCoupon(CouponEntity couponEntity) async {
    List<Condition> conditionEntity = [
      for (final c in couponEntity.condition)
        Condition(
            count: c.count, check: c.check, logic: c.logic, value: c.value)
    ];
    final couponAdd = CouponModel(
      id: couponEntity.id,
      title: couponEntity.title,
      couponType: couponEntity.couponType,
      percentageOrAmount: couponEntity.percentageOrAmount,
      code: couponEntity.code!,
      condition: [
        for (final c in conditionEntity)
          Condition(
              count: c.count, check: c.check, logic: c.logic, value: c.value)
      ],
    );
    await datasource.add(couponAdd);
  }

  @override
  Stream<List<CouponEntity>> getAll() async* {
    final data = datasource.getAllCoupons();
    await for (final snapshot in data) {
      final docs = snapshot;
      yield [
        for (final coupon in docs)
          CouponEntity(
            id: coupon.id,
            title: coupon.title,
            code: coupon.code,
            couponType: coupon.couponType,
            percentageOrAmount: coupon.percentageOrAmount,
            condition: [
              for (final d in coupon.condition)
                ConditionEntity(
                  count: d.count,
                  check: d.check,
                  logic: d.logic,
                  value: d.value,
                )
            ],
          ),
      ];
    }
  }
}

@riverpod
CouponRepository couponRepository(CouponRepositoryRef ref) {
  return CouponRepositoryImpl(
      datasource: ref.watch(couponFirestoreDatasourceProvider));
}
