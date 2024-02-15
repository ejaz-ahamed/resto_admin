import 'package:resto_admin/features/offer/data/model/offer_firestore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class OfferFirestoreDatasource {
  Future<void> addtofirestore(OfferFirestoreModel model);
}
