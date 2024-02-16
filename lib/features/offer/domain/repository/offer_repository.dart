import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';

abstract class OfferRepository {
  Future<void> addOffer(OfferEntity entity);
}
