import 'dart:io';

import 'package:resto_admin/features/products/data/datasources/category_firestore_datasource.dart';
import 'package:resto_admin/features/products/data/datasources/category_firestore_datasource_impl.dart';
import 'package:resto_admin/features/products/data/datasources/category_storage_datasource.dart';
import 'package:resto_admin/features/products/data/datasources/category_storage_datasource_impl.dart';
import 'package:resto_admin/features/products/data/models/category_model.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';
import 'package:resto_admin/features/products/domain/repository/category_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_repository_impl.g.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryFirestoreDataSource firestoreDataSource;
  final CategoryStorageDataSource storageDataSource;

  CategoryRepositoryImpl(
      {required this.firestoreDataSource, required this.storageDataSource});

  @override
  Future<void> add(CategoryEntity entity) async {
    await firestoreDataSource.add(CategoryModel(
      id: '',
      imagePath: entity.imagePath,
      name: entity.name,
    ));
  }

  @override
  Future<void> remove(String id) async {
    await firestoreDataSource.remove(id);
  }

  @override
  Future<void> update(CategoryEntity updatedEntity) async {
    await firestoreDataSource.update(CategoryModel(
      id: updatedEntity.id,
      imagePath: updatedEntity.imagePath,
      name: updatedEntity.name,
    ));
  }

  @override
  Stream<List<CategoryEntity>> getAll() async* {
    final data = firestoreDataSource.getAll();
    await for (final snapshot in data) {
      final docs = snapshot.docs;
      yield [
        for (final cat in docs)
          CategoryEntity(
              id: cat.id,
              imagePath: cat.data().imagePath,
              name: cat.data().name)
      ];
    }
  }

  @override
  Future<String> upload(File fileToUpload, String filePath) {
    return storageDataSource.add(fileToUpload, filePath);
  }
}

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  return CategoryRepositoryImpl(
      firestoreDataSource: ref.watch(categoryDataSourceProvider),
      storageDataSource: ref.watch(categoryStorageDataSourceProvider));
}
