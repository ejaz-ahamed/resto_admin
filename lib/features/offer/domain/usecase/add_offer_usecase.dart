import 'dart:io';

import 'package:resto_admin/core/enums/offer_type.dart';
import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';
import 'package:resto_admin/features/offer/domain/repository/offer_repository.dart';

final class AddOfferUseCase {
  final OfferRepository repository;
  AddOfferUseCase({required this.repository});
  Future<void> call({
    required String imagePath,
    required String id,
    required String name,
    required String description,
    required double amount,
    required OfferType offerType,
    required List<String> product,
  }) async {
    try {
      final uploadPath = await repository.upload(File(imagePath), name);
      return await repository.addOffer(OfferEntity(
          imagePath: uploadPath,
          name: name,
          description: description,
          offerType: offerType,
          products: product,
          amount: amount,
          id: id));
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
