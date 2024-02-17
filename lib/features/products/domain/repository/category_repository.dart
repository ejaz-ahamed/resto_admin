import 'package:resto_admin/features/products/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<void> add(CategoryEntity entity);
  Future<void> remove(String id);
  Future<void> update(CategoryEntity updatedEntity);
}
