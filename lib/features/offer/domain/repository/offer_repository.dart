import 'dart:io';

import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';

abstract class OfferRepository {
  Future<void> addOffer(OfferEntity entity);
  Stream<List<OfferEntity>> getAll();
    Future<String> upload(File fileToUpload, String filePath);
}
