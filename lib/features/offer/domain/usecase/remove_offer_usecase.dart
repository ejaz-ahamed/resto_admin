import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/offer/domain/repository/offer_repository.dart';

final class RemoveOffer {
  final OfferRepository repository;
  RemoveOffer({required this.repository});

  Future<void> call(String offerId) async {
    try {
      await repository.deleteOffer(offerId);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
