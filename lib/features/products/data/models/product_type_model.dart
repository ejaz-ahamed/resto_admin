import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_type_model.g.dart';
part 'product_type_model.freezed.dart';

@freezed
class ProductTypeModel with _$ProductTypeModel {
  const ProductTypeModel._();
  factory ProductTypeModel({
    required String name,
    required String price,
    required String id,
  }) = _ProductTypeModel;

  factory ProductTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeModelFromJson(json);

  factory ProductTypeModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return ProductTypeModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
