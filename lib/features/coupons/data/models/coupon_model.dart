import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/core/enums/coupon_type.dart';

part 'coupon_model.freezed.dart';
part 'coupon_model.g.dart';

enum ConditionValue {
  count,
  amount;
}
enum ConditionType{
  equalTo,
  greaterThan
}
enum ConditionLogic{
  and,
  or
}

@freezed
class CouponModel with _$CouponModel {
  factory CouponModel({
    required String? id,
    required String? title,
    required CouponType couponType,
    required double percentageOrAmount,
    required ConditionValue count,
    required ConditionType equal,
    required double value,
    required ConditionLogic andOr,
  }) = _CouponModel;

  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);

  factory CouponModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    data['id'] = snapshot.id;
    return CouponModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson()..remove('id');
  }
}
