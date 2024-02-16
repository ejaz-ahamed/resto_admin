import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';
import 'package:resto_admin/features/offer/domain/repository/offer_repository.dart';

final class AddOfferUsecase {
  final OfferRepository repository;
  AddOfferUsecase({required this.repository});

  Future<void> call(OfferEntity entityclass) async {
    try {
      await repository.addOffer(entityclass);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
