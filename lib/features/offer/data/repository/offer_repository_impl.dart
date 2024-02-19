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
        imagepath: entity.imagepath,
        name: entity.name,
        description: entity.description,
        offerType: entity.offerType,
        product: entity.product,
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
              imagepath: offer.imagepath,
              name: offer.name,
              description: offer.description,
              amount: offer.amount,
              offerType: offer.offerType,
              product: offer.product,
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
