import 'package:resto_admin/core/enums/coupon_type.dart';
import 'package:resto_admin/features/coupons/data/repository/coupon_repository_impl.dart';
import 'package:resto_admin/features/coupons/domain/entities/condition_entity.dart';
import 'package:resto_admin/features/coupons/domain/entities/coupon_entity.dart';
import 'package:resto_admin/features/coupons/domain/usecases/add_coupon_usecase.dart';
import 'package:resto_admin/features/coupons/domain/usecases/delete_coupon_usecase.dart';
import 'package:resto_admin/features/coupons/domain/usecases/get_coupon_usecase.dart';
import 'package:resto_admin/features/coupons/domain/usecases/update_coupon_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coupon_provider.g.dart';

@riverpod
class Coupon extends _$Coupon {
  @override
  void build() {}

  Future<void> addCoupon({
    required String? title,
    required String code,
    required CouponType couponType,
    required double percentageOrAmount,
    required List<ConditionEntity> conditions,
  }) {
    final repository = ref.watch(couponRepositoryProvider);
    return AddCouponUsecase(repository: repository)(
      title: title,
      code: code,
      couponType: couponType,
      percentageOrAmount: percentageOrAmount,
      conditions: conditions,
    );
  }

  Future<void> updateCoupon({
    required String id,
    required String? title,
    required String code,
    required CouponType couponType,
    required double percentageOrAmount,
    required List<ConditionEntity> conditions,
  }) {
    final repository = ref.read(couponRepositoryProvider);
    return UpdateCouponUsecase(repository: repository)(
        id: id,
        code: code,
        conditions: conditions,
        couponType: couponType,
        percentageOrAmount: percentageOrAmount,
        title: title);
  }

  Future<void> deleteCoupon({required String id}) {
    final repository = ref.read(couponRepositoryProvider);
    return DeleteCouponUseCase(repository: repository)(id);
  }
}

@riverpod
Stream<List<CouponEntity>> getCoupons(GetCouponsRef ref) {
  final repository = ref.read(couponRepositoryProvider);
  return GetCouponUseCase(repository: repository)();
}
