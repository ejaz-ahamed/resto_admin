import 'package:resto_admin/features/offer/domain/entity/offer_firestore_entity.dart';

abstract class OfferFirestoreRepository {
  Future<void> addOffer(OfferFirestoreEntity entity);
}
