import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/features/products/data/models/product_addon_model.dart';
import 'package:resto_admin/features/products/data/models/product_type_model.dart';
part 'product_model.g.dart';
part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();

  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory ProductModel({
    required String id,
    required String imagePath,
    required String name,
    required String description,
    required List<ProductTypeModel> types,
    required List<ProductAddonModel> addOns,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  factory ProductModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    data['id'] = snapshot.id;
    return ProductModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson()..remove('id');
  }
}
