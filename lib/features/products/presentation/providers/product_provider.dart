import 'package:resto_admin/features/products/data/repository/product_repository_impl.dart';
import 'package:resto_admin/features/products/domain/entities/product_addon_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_type_entity.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';
import 'package:resto_admin/features/products/domain/usecases/add_product_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/delete_addon_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/delete_product_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/delete_type_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/get_product_by_id_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/get_product_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/search_product_usecase.dart';
import 'package:resto_admin/features/products/presentation/providers/category_provider.dart';
import 'package:resto_admin/features/products/presentation/providers/products_provider_state.dart';
import 'package:resto_admin/features/products/domain/usecases/update_product_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@Riverpod(keepAlive: true)
class Product extends _$Product {
  late ProductRepository repository;

  @override
  ProductProviderState build() {
    repository = ref.read(productRepositoryProvider);
    return ProductProviderState(
      searchedProducts: null,
    );
  }

  void clearSearchList() {
    state = state.copyWith(searchedProducts: null);
  }

  Future<void> addProduct({
    required String name,
    required String description,
    required String imagePath,
    required String id,
    required List<ProductTypeEntity> types,
    required List<ProductAddOnEntity> addOns,
    required String categoryId,
    required String availableFrom,
    required String availableTo,
  }) {
    repository = ref.read(productRepositoryProvider);
    return AddProductUsecase(repository: repository)(
        categoryId: categoryId,
        addOns: addOns,
        types: types,
        id: id,
        name: name,
        description: description,
        imagePath: imagePath,
        availableFrom: availableFrom,
        availableto: availableTo);
  }

  Future<void> deleteProduct(String id) {
    final repository = ref.read(productRepositoryProvider);
    return DeleteProductUsecase(repository: repository)(id);
  }

  Future<void> deleteAddOn(String id, String addOnId) async {
    repository = ref.read(productRepositoryProvider);
    return DeleteAddOnUseCase(repository: repository)(id, addOnId);
  }

  Future<void> deleteType(String id, String typeId) async {
    repository = ref.read(productRepositoryProvider);
    return DeleteTypeUseCase(repository: repository)(id, typeId);
  }

  void search(String keyword) async {
    final searchedProducts = await SearchProductUsecase(repository: repository)(
        keyword, ref.read(categoryProvider).selectedCategory);
    state = state.copyWith(searchedProducts: searchedProducts);
  }

  Future<void> updateProduct({
    required String name,
    required String description,
    required String imagePath,
    required String id,
    required List<ProductTypeEntity> types,
    required List<ProductAddOnEntity> addOns,
    required String categoryId,
    required String availabeFrom,
    required String availableTo,
  }) {
    repository = ref.read(productRepositoryProvider);
    return UpdatedProductUseCase(repository: repository)(
        categoryId: categoryId,
        addOns: addOns,
        types: types,
        id: id,
        name: name,
        description: description,
        imagePath: imagePath,
        availableFrom: availabeFrom,
        availableTo: availableTo);
  }

  /// Get a product with the given product ID
  Future<ProductEntity> getProductById(String productId) {
    return GetProductByIdUseCase(
        repository: ref.read(productRepositoryProvider))(productId);
  }
}

@riverpod
Stream<List<ProductEntity>> getAllProductsByCategory(
    GetAllProductsByCategoryRef ref, String categoryId) {
  final repository = ref.read(productRepositoryProvider);
  return GetAllProductsUseCase(repository: repository)(categoryId);
}
