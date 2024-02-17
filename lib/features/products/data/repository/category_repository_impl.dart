import 'package:resto_admin/features/products/data/datasources/category_firestore_datasource.dart';
import 'package:resto_admin/features/products/data/datasources/category_firestore_datasource_impl.dart';
import 'package:resto_admin/features/products/data/models/category_model.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';
import 'package:resto_admin/features/products/domain/repository/category_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_repository_impl.g.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryFirestoreDataSource dataSource;
  CategoryRepositoryImpl({required this.dataSource});

  @override
  Future<void> add(CategoryEntity entity) async {
    await dataSource.add(CategoryModel(
      id: '',
      imagePath: entity.imagePath,
      name: entity.name,
    ));
  }

  @override
  Future<void> remove(String id) async {
    await dataSource.remove(id);
  }

  @override
  Future<void> update(CategoryEntity updatedEntity) async {
    await dataSource.update(CategoryModel(
      id: updatedEntity.id,
      imagePath: updatedEntity.imagePath,
      name: updatedEntity.name,
    ));
  }
}

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  return CategoryRepositoryImpl(dataSource: ref.watch(categoryDataSourceProvider));
}