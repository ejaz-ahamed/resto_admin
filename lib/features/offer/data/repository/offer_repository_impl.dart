import 'dart:io';

import 'package:resto_admin/features/offer/data/datasource/offer_firestore_datasource.dart';
import 'package:resto_admin/features/offer/data/datasource/offer_firestore_datasource_impl.dart';
import 'package:resto_admin/features/offer/data/datasource/offer_storage_datasource.dart';
import 'package:resto_admin/features/offer/data/datasource/offer_storage_datasource_impl.dart';
import 'package:resto_admin/features/offer/data/model/offer_model.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';
import 'package:resto_admin/features/offer/domain/repository/offer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offer_repository_impl.g.dart';

class OfferRepositoryImpl implements OfferRepository {
  final OfferFirestoreDatasource datasource;
  final OfferStorageDataSource offerStorageDataSource;
  OfferRepositoryImpl(
      {required this.datasource, required this.offerStorageDataSource});
  @override
  Future<void> addOffer(OfferEntity entity) async {
    final offeradd = OfferModel(
        id: entity.id,
        imagePath: entity.imagePath,
        name: entity.name,
        description: entity.description,
        offerType: entity.offerType,
        amount: entity.amount,
        products: entity.products);
    await datasource.add(offeradd);
  }

  @override
  Future<void> deleteOffer(String offerId) async {
    await datasource.delete(offerId);
  }

  @override
  Future<void> update(OfferEntity offerEntity) async {
    await datasource.update(OfferModel(
      id: offerEntity.id,
      imagePath: offerEntity.imagePath,
      name: offerEntity.name,
      description: offerEntity.description,
      offerType: offerEntity.offerType,
      products: offerEntity.products,
      amount: offerEntity.amount,
    ));
  }

  @override
  Stream<List<OfferEntity>> getAll() async* {
    final data = datasource.getAllOffer();
    await for (final snapshot in data) {
      final docs = snapshot;
      yield [
        for (final offer in docs)
          OfferEntity(
              imagePath: offer.imagePath,
              name: offer.name,
              description: offer.description,
              amount: offer.amount,
              offerType: offer.offerType,
              products: offer.products,
              id: offer.id)
      ];
    }
  }

  @override
  Future<String> upload(File fileToUpload, String filePath) {
    return offerStorageDataSource.add(fileToUpload, filePath);
  }
}

@riverpod
OfferRepository offerRepository(OfferRepositoryRef ref) {
  return OfferRepositoryImpl(
      datasource: ref.read(offerFirestoreDatasourceProvider),
      offerStorageDataSource: ref.read(offerStorageDataSourceProvider));
}
