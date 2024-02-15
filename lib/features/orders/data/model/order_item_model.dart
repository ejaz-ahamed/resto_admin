import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_item_model.freezed.dart';
part 'order_item_model.g.dart';

@freezed
class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    required String productId,
    required String type,
    required String quality,
  }) = _OrderItemModel;
  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  factory OrderItemModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return OrderItemModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
