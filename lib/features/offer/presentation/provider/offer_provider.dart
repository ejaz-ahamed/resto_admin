import 'package:resto_admin/core/enums/offer_type.dart';
import 'package:resto_admin/features/offer/data/repository/offer_repository_impl.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';
import 'package:resto_admin/features/offer/domain/usecase/add_offer_usecase.dart';
import 'package:resto_admin/features/offer/domain/usecase/get_offer_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offer_provider.g.dart';

@riverpod
class Offer extends _$Offer {
  // late OfferRepository repository;
  @override
  List<OfferEntity>? build() {
    return null;
  }

  Future<void> addOffer({
    required String id,
    required String imagepath,
    required String name,
    required String description,
    required double amount,
    required OfferType offerType,
    required List<String>? product,
  }) {
    final repository = ref.watch(offerRepositoryProvider);
    return AddOfferUseCase(repository: repository)(
        id: id,
        imagepath: imagepath,
        name: name,
        description: description,
        amount: amount,
        offerType: offerType,
        product: product = []);
  }

  Stream<List<OfferEntity>> getAll() {
    final repository = ref.watch(offerRepositoryProvider);
    return GetOfferUseCase(repository: repository)();
  }
}
