import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_admin/features/products/data/datasources/category_firestore_datasource.dart';
import 'package:resto_admin/features/products/data/models/category_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_firestore_datasource_impl.g.dart';

class CategoryFirestoreDataSourceImpl implements CategoryFirestoreDataSource {
  final collection = FirebaseFirestore.instance
      .collection('category')
      .withConverter(
          fromFirestore: CategoryModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());

  @override
  Future<void> add(CategoryModel model) async {
    await collection.doc(model.name.toLowerCase().trim()).set(model);
  }

  @override
  Future<void> remove(String id) async {
    await collection.doc(id).delete();
  }

  @override
  Future<void> update(CategoryModel updatedModel) async {
    await collection
        .doc(updatedModel.name.toLowerCase().trim())
        .set(updatedModel);
  }

  @override
  Stream<List<CategoryModel>> getAll() async* {
    final categorySteame = collection.snapshots();
    await for (final categorys in categorySteame) {
      yield [
        for (final category in categorys.docs) category.data(),
      ];
    }
  }

  @override
  Future<CategoryModel> getbyId(String id) async {
    final data = await collection.doc(id).get();
    return data.data()!;
  }
}

@riverpod
CategoryFirestoreDataSource categoryDataSource(CategoryDataSourceRef ref) {
  return CategoryFirestoreDataSourceImpl();
}
