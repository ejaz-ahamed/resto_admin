import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/offer/domain/repository/offer_repository.dart';

final class RemoveOfferUsecase {
  final OfferRepository repository;
  RemoveOfferUsecase({required this.repository});
  Future<void> call(String offerId) async {
    try {
      final data = await repository.getById(offerId);
      await repository.deleteStorage(data.name);
      return repository.delete(offerId);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
