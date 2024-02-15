import 'package:resto_admin/features/offer/data/datasource/offer_firestore_datasource.dart';
import 'package:resto_admin/features/offer/data/model/offer_firestore_model.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_firestore_entity.dart';
import 'package:resto_admin/features/offer/domain/repository/offer_firestore_repository.dart';

class OfferFirestoreRepositoryImpl implements OfferFirestoreRepository {
  final OfferFirestoreDatasource datasource;
  OfferFirestoreRepositoryImpl({required this.datasource});
  @override
  Future<void> addtofirestore(OfferFirestoreEntity entity) async {
    final offeradd = OfferFirestoreModel(
        imagepath: entity.imagepath,
        name: entity.name,
        description: entity.description,
        offerType: entity.offerType,
        product: entity.product);
    await datasource.addtofirestore(offeradd);
  }
}
