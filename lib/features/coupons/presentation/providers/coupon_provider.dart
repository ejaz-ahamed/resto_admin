import 'package:resto_admin/core/enums/coupon_type.dart';
import 'package:resto_admin/features/coupons/data/models/condition_model.dart';
import 'package:resto_admin/features/coupons/data/repository/coupon_repository_impl.dart';
import 'package:resto_admin/features/coupons/domain/entities/condition_entity.dart';
import 'package:resto_admin/features/coupons/domain/usecases/add_coupon_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coupon_provider.g.dart';

@riverpod
class Coupon extends _$Coupon {
  @override
  void build() {}

  Future<void> addCoupon({
    required String? id,
    required String? title,
    required String code,
    required CouponType couponType,
    required double percentageOrAmount,
    required List<ConditionEntity> condition,
  }) {
    final repository = ref.watch(couponRepositoryProvider);
    return AddCouponUsecase(repository: repository)(
        id: id,
        title: title,
        code: code,
        couponType: couponType,
        percentageOrAmount: percentageOrAmount,
        condition: []);
  }
}
