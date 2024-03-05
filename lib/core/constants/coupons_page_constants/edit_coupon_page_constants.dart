import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_coupon_page_constants.g.dart';

class EditCouponPageConstants {
  final txtAppbarTitle = 'Edit Coupons';
  final txtTitle = 'Title';
  final txtHintTextTitle = 'Enter Title...';
  final txtCode = 'Code';
  final txtHintTextCode = 'Enter Code...';
  final txtType = 'Type';
  final txtAmountText = 'Amount';
  final txtPercentageText = 'Percentage';
  final txtFreeDelivery = 'Free Delivery';
  final txtHintTextPercentag = 'Enter Percentage';
  final txtHintTextAmount = 'Enter Amount';
  final txtCondition = 'Conditions';
  final txtDelete = 'Delete';
  final txtSave = 'Save';
  final txtFreeDeliveryApply = 'Free Delivery Applied';
}

@riverpod
EditCouponPageConstants editCouponPageConstants(
    EditCouponPageConstantsRef ref) {
  return EditCouponPageConstants();
}
