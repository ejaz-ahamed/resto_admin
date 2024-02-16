import 'package:resto_admin/features/offer/data/datasource/offer_firestore_datasource.dart';
import 'package:resto_admin/features/offer/data/datasource/offer_firestore_datasource_impl.dart';
import 'package:resto_admin/features/offer/data/model/offer_model.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';
import 'package:resto_admin/features/offer/domain/repository/offer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offer_repository_impl.g.dart';

class OfferRepositoryImpl implements OfferRepository {
  final OfferFirestoreDatasource datasource;
  OfferRepositoryImpl({required this.datasource});
  @override
  Future<void> addOffer(OfferEntity entity) async {
    final offeradd = OfferModel(
        imagepath: entity.imagepath,
        name: entity.name,
        description: entity.description,
        offerType: entity.offerType,
        product: entity.product);
    await datasource.add(offeradd);
  }
}

@riverpod
OfferRepository offerRepository(OfferRepositoryRef ref) {
  return OfferRepositoryImpl(
      datasource: ref.read(offerFirestoreDatasourceProvider));
}
