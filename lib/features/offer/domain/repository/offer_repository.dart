import 'dart:io';

import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';

abstract class OfferRepository {
  Future<void> addOffer(OfferEntity entity);
  Stream<List<OfferEntity>> getAll();
  Future<void> delete(String offerId);
  Future<void> updateOffer(OfferEntity updatedEntity, String id);
  Future<String> upload(File fileToUpload, String filePath);
  Future<OfferEntity> getById(String id);
  Future<void> deleteStorage(String fileName);
}
