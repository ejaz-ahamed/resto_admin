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
        id: '',
        imagePath: entity.imagePath,
        name: entity.name,
        description: entity.description,
        offerType: entity.offerType,
        products: entity.products,
        amount: entity.amount);
    await datasource.add(offeradd);
  }

  @override
  Stream<List<OfferEntity>> getAll() async* {
    final data = datasource.getAllOffer();
    await for (final snapshot in data) {
      final docs = snapshot;
      yield [
        for (final offer in docs)
          OfferEntity(
              imagePath: offer.imagePath ?? '',
              name: offer.name ?? '',
              description: offer.description ?? '',
              amount: offer.amount ?? 0,
              offerType: offer.offerType,
              products: offer.products,
              id: offer.id ?? '')
      ];
    }
  }

  @override
  Future<String> upload(File fileToUpload, String filePath) {
    return offerStorageDataSource.add(fileToUpload, filePath);
  }

  @override
  Future<void> delete(String offerId) async {
    await datasource.delete(offerId);
  }

  @override
  Future<void> updateOffer(OfferEntity updatedEntity, String offerId) async {
    await datasource.update(
        OfferModel(
            id: updatedEntity.id,
            imagePath: updatedEntity.imagePath,
            name: updatedEntity.name,
            description: updatedEntity.description,
            amount: updatedEntity.amount,
            offerType: updatedEntity.offerType,
            products: updatedEntity.products),
        offerId);
  }

  @override
  Future<OfferEntity> getById(String id) async {
    final data = await datasource.getById(id);
    return OfferEntity(
        id: data.id ?? '',
        imagePath: data.imagePath ?? '',
        name: data.name ?? '',
        description: data.description ?? '',
        amount: data.amount ?? 0,
        offerType: data.offerType,
        products: data.products);
  }

  @override
  Future<void> deleteStorage(String fileName) async {
    await offerStorageDataSource.deleteStorage(fileName);
  }
}

@riverpod
OfferRepository offerRepository(OfferRepositoryRef ref) {
  return OfferRepositoryImpl(
      datasource: ref.read(offerFirestoreDatasourceProvider),
      offerStorageDataSource: ref.read(offerStorageDataSourceProvider));
}
