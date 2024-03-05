import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/features/coupons/data/models/condition_model.dart';

part 'coupon_condition_state.freezed.dart';

/// Model class to handle the state for the
@freezed
class CouponConditionState with _$CouponConditionState {
  factory CouponConditionState(
      {required TextEditingController valueController,
      required ConditionType countOrAmount,
      required ConditionCheck condition,
      required ConditionLogic andOr}) = _CouponConditionState;
}
