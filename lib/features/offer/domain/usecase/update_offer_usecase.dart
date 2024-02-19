import 'dart:io';
import 'package:resto_admin/core/enums/offer_type.dart';
import 'package:resto_admin/core/exception/base_exception.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';
import 'package:resto_admin/features/offer/domain/repository/offer_repository.dart';

final class UpdateOfferUseCase {
  final OfferRepository repository;
  UpdateOfferUseCase({required this.repository});
  Future<void> call({
    required String imagePath,
    required String id,
    required String name,
    required String description,
    required double amount,
    required OfferType offerType,
    required List<String> products,
  }) async {
    try {
      if (imagePath.startsWith('http')) {
        final data = await repository.getById(id);
        imagePath = data.imagePath;
      } else {
        final data = await repository.getById(id);
        await repository.deleteOffer(data.name);
        imagePath = await repository.upload(File(imagePath), name);
      }
      await repository.update(
        OfferEntity(
            id: id,
            imagePath: imagePath,
            name: name,
            description: description,
            amount: amount,
            offerType: offerType,
            products: products),
      );
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
