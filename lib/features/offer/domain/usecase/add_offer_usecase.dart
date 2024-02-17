import 'package:resto_admin/core/enums/offer_type.dart';
import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';
import 'package:resto_admin/features/offer/domain/repository/offer_repository.dart';

final class AddOfferUseCase {
  final OfferRepository repository;
  AddOfferUseCase({required this.repository});
  Future<void> call({
    required String id,
    required String imagePath,
    required String name,
    required String description,
    required OfferType offerType,
    required List<String> product,
    required double amount,
  }) async {
    try {
      return await repository.addOffer(OfferEntity(
          id: id,
          imagePath: imagePath,
          name: name,
          description: description,
          offerType: offerType,
          amount: amount,
          product: product));
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
