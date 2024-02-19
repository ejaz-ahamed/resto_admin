import 'dart:io';

import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';

abstract class OfferRepository {
  Future<void> addOffer(OfferEntity entity);
  Future<void> deleteOffer(String offerId);
  Future<void> update(OfferEntity updatedEntity);
  Future<String> upload(File fileToUpload, String filePath);
  Stream<List<OfferEntity>> getAll();
  Future<OfferEntity> getById(String id);
}
