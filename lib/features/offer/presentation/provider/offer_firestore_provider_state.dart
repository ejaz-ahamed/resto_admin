import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_firestore_entity.dart';

part 'offer_firestore_provider_state.freezed.dart';

@freezed
class OfferFirestoreProviderState with _$OfferFirestoreProviderState {
  factory OfferFirestoreProviderState({
    required List<OfferFirestoreEntity> getOfferdata,
  }) = _OfferFirestoreProviderState;
}
