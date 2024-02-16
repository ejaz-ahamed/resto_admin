import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_firestore_entity.dart';
import 'package:resto_admin/features/offer/domain/repository/offer_firestore_repository.dart';

final class AddOfferUsecase {
  final OfferFirestoreRepository repository;
  AddOfferUsecase({required this.repository});

  Future<void> call(OfferFirestoreEntity entityclass) async {
    try {
      await repository.addOffer(entityclass);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
