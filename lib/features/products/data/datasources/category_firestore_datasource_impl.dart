import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_admin/features/products/data/datasources/category_firestore_datasource.dart';
import 'package:resto_admin/features/products/data/models/category_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_firestore_datasource_impl.g.dart';

class CategoryFirestoreDataSourceImpl implements CategoryFirestoreDataSource {
  final firestore = FirebaseFirestore.instance;
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
    await collection.doc(updatedModel.id).set(updatedModel);
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

  @override
  Future<void> deleteMany(List<String> docIdsToDelete) async {
    final batch = firestore.batch();
    for (final docId in docIdsToDelete) {
      final docRef = collection.doc(docId);
      batch.delete(docRef);
    }
    await batch.commit();
  }
}

@riverpod
CategoryFirestoreDataSource categoryDataSource(CategoryDataSourceRef ref) {
  return CategoryFirestoreDataSourceImpl();
}
