import 'package:resto_admin/features/offer/data/model/offer_firestore_model.dart';

abstract class OfferFirestoreDatasource {
  Future<void> addtofirestore(OfferFirestoreModel model);
}
