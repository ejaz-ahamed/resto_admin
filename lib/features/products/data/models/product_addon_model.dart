import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_addon_model.g.dart';
part 'product_addon_model.freezed.dart';

@freezed
class ProductAddonModel with _$ProductAddonModel {
  const ProductAddonModel._();
  factory ProductAddonModel({
    required String name,
    required String id,
    required String price,
  }) = _ProductAddonModel;

  factory ProductAddonModel.fromJson(Map<String, dynamic> json) =>
      _$ProductAddonModelFromJson(json);

  factory ProductAddonModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return ProductAddonModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
