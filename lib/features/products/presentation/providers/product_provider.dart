import 'package:resto_admin/features/products/data/repository/product_repository_impl.dart';
import 'package:resto_admin/features/products/domain/entities/product_addon_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_type_entity.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';
import 'package:resto_admin/features/products/domain/usecases/add_product_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/delete_addon_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/delete_product_usecase.dart';

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
<<<<<<< HEAD
  List<ProductEntity> build() {
    repository = ref.read(productRepositoryProvider);
    return [];
=======
  ProductProviderState build() {
    repository = ref.read(productRepositoryProvider);
    return ProductProviderState(
      selectedCategoryProducts: [],
      searchedProducts: null,
    );
  }

  void clearSearchList() {
    state = state.copyWith(searchedProducts: null);
>>>>>>> ea6dee2fa44b5e844499788bd46db9db41983504
  }

  Future<void> addProduct({
    required String name,
    required String description,
    required String imagePath,
    required String id,
    required List<ProductTypeEntity> types,
    required List<ProductAddOnEntity> addOns,
    required String categoryId,
  }) {
    repository = ref.read(productRepositoryProvider);
    return AddProductUsecase(repository: repository)(
        categoryId: categoryId,
        addOns: addOns,
        types: types,
        id: id,
        name: name,
        description: description,
        imagePath: imagePath);
  }

  Future<void> deleteProduct(String id) {
    final repository = ref.read(productRepositoryProvider);
    return DeleteProductUsecase(repository: repository)(id);
  }

  Future<void> deleteAddOn(String id, String addOnId) async {
    repository = ref.read(productRepositoryProvider);
    return DeleteAddOnUseCase(repository: repository)(id, addOnId);
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
  }) {
    repository = ref.read(productRepositoryProvider);
    return UpdatedProductUseCase(repository: repository)(
        categoryId: categoryId,
        addOns: addOns,
        types: types,
        id: id,
        name: name,
        description: description,
        imagePath: imagePath);
  }
}

@riverpod
Stream<List<ProductEntity>> getAllProductsByCategory(
    GetAllProductsByCategoryRef ref, String categoryId) {
  final repository = ref.read(productRepositoryProvider);
  return GetAllProductsUseCase(repository: repository)(categoryId);
}
