import 'package:flutter/material.dart';
import 'package:resto_admin/features/products/data/repository/product_repository_impl.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';
import 'package:resto_admin/features/products/domain/usecases/add_product_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/delete_product_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@riverpod
class Product extends _$Product {
  late ProductRepository repository;
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void build() {}

  Future<void> addProduct(ProductEntity entity) {
    final repository = ref.watch(productRepositoryProvider);
    return AddProductUsecase(repository: repository)(entity);
  }

  Future<void> deleteProduct(String id) {
    final repository = ref.watch(productRepositoryProvider);
    return DeleteProductUsecase(repository: repository)(id);
  }
}
