import 'package:resto_admin/core/enums/offer_type.dart';
import 'package:resto_admin/features/offer/data/repository/offer_repository_impl.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';
import 'package:resto_admin/features/offer/domain/usecase/add_offer_usecase.dart';
import 'package:resto_admin/features/offer/domain/usecase/get_offer_usecase.dart';
import 'package:resto_admin/features/offer/domain/usecase/remove_offer_usecase.dart';
import 'package:resto_admin/features/offer/domain/usecase/update_offer_usecase.dart';
import 'package:resto_admin/features/products/data/repository/product_repository_impl.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/domain/usecases/get_many_products_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offer_provider.g.dart';

@riverpod
class Offer extends _$Offer {
  @override
  void build() {}

  Future<void> addOffer({
    required String id,
    required String imagePath,
    required String name,
    required String description,
    required double amount,
    required OfferType offerType,
    required List<String> product,
  }) {
    final repository = ref.watch(offerRepositoryProvider);
    return AddOfferUseCase(repository: repository)(
        id: id,
        imagePath: imagePath,
        name: name,
        description: description,
        amount: amount,
        offerType: offerType,
        product: product = product);
  }

  Future<void> remove({required String id}) async {
    final repository = ref.watch(offerRepositoryProvider);
    await RemoveOfferUsecase(repository: repository)(id);
  }

  Future<void> updateOffer({
    required String id,
    required String imagePath,
    required String name,
    required String description,
    required double amount,
    required OfferType offerType,
    required List<String> product,
  }) async {
    final repository = ref.watch(offerRepositoryProvider);
    await UpdateOfferUseCase(repository: repository)(
        id: id,
        imagePath: imagePath,
        name: name,
        description: description,
        amount: amount,
        offerType: offerType,
        product: product = product);
  }

  /// Get the selected products
  Future<List<ProductEntity>> getSelectedProducts(
      Set<String> productIds) async {
    return GetManyProductsUseCase(
        repository: ref.read(productRepositoryProvider))(productIds);
  }
}

@riverpod
Stream<List<OfferEntity>> getAllOffers(GetAllOffersRef ref) {
  final repository = ref.read(offerRepositoryProvider);
  return GetOfferUseCase(repository: repository)();
}
