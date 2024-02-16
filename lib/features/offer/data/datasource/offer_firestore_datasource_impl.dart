import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_admin/features/offer/data/datasource/offer_firestore_datasource.dart';
import 'package:resto_admin/features/offer/data/model/offer_firestore_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offer_firestore_datasource_impl.g.dart';

class OfferFirestoreDatasourceImpl implements OfferFirestoreDatasource {
  final collection = FirebaseFirestore.instance
      .collection("offer_data")
      .withConverter(
          fromFirestore: OfferFirestoreModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());
  @override
  Future<void> addtofirestore(OfferFirestoreModel model) async {
    await collection.doc(model.name).set(model);
  }
}

@riverpod
OfferFirestoreDatasource offerFirestoreDatasource(
    OfferFirestoreDatasourceRef ref) {
  return OfferFirestoreDatasourceImpl();
}
