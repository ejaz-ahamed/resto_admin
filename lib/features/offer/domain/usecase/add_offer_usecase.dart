import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';
import 'package:resto_admin/features/offer/domain/repository/offer_repository.dart';

final class AddOfferUseCase {
  final OfferRepository repository;
  AddOfferUseCase({required this.repository});
  Future<void> call(OfferEntity offerEntity) async {
    try {
      repository.addOffer(offerEntity);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
