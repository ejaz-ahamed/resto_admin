import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/features/offer/data/model/offer_type_model.dart';

part 'offer_firestore_entity.freezed.dart';

@freezed
class OfferFirestoreEntity with _$OfferFirestoreEntity {
  const factory OfferFirestoreEntity({
    required String imagepath,
    required String name,
    required String description,
    required OfferTypeModel offerType,
    required List<String> product,
  }) = _OfferFirestoreEntity;
}
