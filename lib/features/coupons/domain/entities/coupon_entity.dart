import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/core/enums/coupon_type.dart';
import 'package:resto_admin/features/coupons/data/models/condition_model.dart';

part 'coupon_entity.freezed.dart';

@freezed
class CouponEntity with _$CouponEntity {
  factory CouponEntity({
    required String? id,
    required String? title,
    required String? code,
    required CouponType couponType,
    required double percentageOrAmount,
    required List<Condition> count,
    required List<Condition> equal,
    required List<Condition> value,
    required List<Condition> andOr,
  }) = _CouponEntity;
}
