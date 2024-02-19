import 'package:resto_admin/features/products/data/models/category_model.dart';

abstract class CategoryFirestoreDataSource {
  Future<void> add(CategoryModel model);
  Future<void> remove(String id);
  Future<void> update(CategoryModel updatedModel);
  Stream<List<CategoryModel>> getAll();
}
