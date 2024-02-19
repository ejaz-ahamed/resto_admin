import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/core/enums/offer_type.dart';

part 'offer_entity.freezed.dart';

@freezed
class OfferEntity with _$OfferEntity {
  const factory OfferEntity({
    required String id,
    required String imagePath,
    required String name,
    required String description,
    required OfferType offerType,
    required List<String> products,
    required double amount,
  }) = _OfferEntity;
}
