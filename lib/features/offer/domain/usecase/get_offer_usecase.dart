import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';
import 'package:resto_admin/features/offer/domain/repository/offer_repository.dart';

final class GetOfferUseCase {
  final OfferRepository repository;

  GetOfferUseCase({required this.repository});

  Stream<List<OfferEntity>> call() {
    try {
      return repository.getAll();
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
