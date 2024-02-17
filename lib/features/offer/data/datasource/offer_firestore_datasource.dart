import 'package:resto_admin/features/offer/data/model/offer_model.dart';

abstract class OfferFirestoreDatasource {
  Future<void> add(OfferModel model);
  Future<void> delete(String offerId);
  Future<void> update(OfferModel model);
  Stream<List<OfferModel>> getAllOffer();
}
