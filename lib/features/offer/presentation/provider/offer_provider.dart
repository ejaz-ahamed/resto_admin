import 'package:resto_admin/features/offer/data/repository/offer_repository_impl.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';
import 'package:resto_admin/features/offer/domain/repository/offer_repository.dart';
import 'package:resto_admin/features/offer/domain/usecase/add_offer_usecase.dart';
import 'package:resto_admin/features/offer/domain/usecase/remove_offer_usecase.dart';
import 'package:resto_admin/features/offer/domain/usecase/update_offer_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offer_provider.g.dart';

@riverpod
class OfferProvider extends _$OfferProvider {
  late OfferRepository repository;
  @override 
  void build() {}
  Future<void> addOffer(OfferEntity offerEntity) {
    return AddOfferUseCase(repository: repository)(offerEntity);
  }

  Future<void> deleteOffer(String id) async {
    final repository = ref.watch(offerRepositoryProvider);
    await RemoveOfferUsecase(repository: repository)(id);
  }

  Future<void> update(OfferEntity offerEntity) async {
    return UpdateOfferUseCase(repository: repository)(offerEntity);
  }
}
