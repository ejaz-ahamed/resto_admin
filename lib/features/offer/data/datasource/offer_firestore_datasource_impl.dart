import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_admin/features/offer/data/datasource/offer_firestore_datasource.dart';
import 'package:resto_admin/features/offer/data/model/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offer_firestore_datasource_impl.g.dart';

class OfferFirestoreDatasourceImpl implements OfferFirestoreDatasource {
  final collection = FirebaseFirestore.instance
      .collection("offers")
      .withConverter(
          fromFirestore: OfferModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());
  @override
  Future<void> add(OfferModel model) async {
    await collection.doc().set(model);
  }

  @override
  Future<void> delete(String offerId) async {
    await collection.doc(offerId).delete();
  }

  @override
  Future<void> update(OfferModel updateModel, String id) async {
    await collection.doc(id).set(updateModel);
  }

  @override
  Stream<List<OfferModel>> getAllOffer() async* {
    final offerSteame = collection.snapshots();
    await for (final offers in offerSteame) {
      yield [
        for (final offer in offers.docs) offer.data(),
      ];
    }
  }

  @override
  Future<OfferModel> getById(String id) async {
    final data = await collection.doc(id).get();
    return data.data()!;
  }
}

@riverpod
OfferFirestoreDatasource offerFirestoreDatasource(
    OfferFirestoreDatasourceRef ref) {
  return OfferFirestoreDatasourceImpl();
}
