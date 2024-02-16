import 'package:resto_admin/core/enums/offer_type.dart';
import 'package:resto_admin/features/offer/data/repository/offer_repository_impl.dart';
import 'package:resto_admin/features/offer/domain/repository/offer_repository.dart';
import 'package:resto_admin/features/offer/domain/usecase/add_offer_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offer_provider.g.dart';

@riverpod
class Offer extends _$Offer {
  late OfferRepository repository;
  @override
  void build() {}
  Future<void> addOffer({
    required String id,
    required String imagePath,
    required String name,
    required String description,
    required OfferType offerType,
    required List<String> product,
  }) {
    final repository = ref.watch(offerRepositoryProvider);
    return AddOfferUseCase(repository: repository)(
        id: id,
        imagePath: imagePath,
        name: name,
        description: description,
        offerType: offerType,
        product: product);
  }
}
