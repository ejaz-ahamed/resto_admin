import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_admin/features/offer/data/model/offer_firestore_enum_model.dart';

part 'offer_firestore_model.freezed.dart';
part 'offer_firestore_model.g.dart';

@freezed
class OfferFirestoreModel with _$OfferFirestoreModel {
  const OfferFirestoreModel._();

  factory OfferFirestoreModel({
    required String imagepath,
    required String name,
    required String description,
    required OfferTypeEnumModel offerType,
    required List<String> product,
  }) = _OfferFirestoreModel;

  factory OfferFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$OfferFirestoreModelFromJson(json);

  factory OfferFirestoreModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return OfferFirestoreModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
