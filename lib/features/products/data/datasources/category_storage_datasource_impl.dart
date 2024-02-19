import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:resto_admin/features/products/data/datasources/category_storage_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_storage_datasource_impl.g.dart';

class CategoryStorageDataSourceImpl implements CategoryStorageDataSource {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> add(File image, String fileName) async {
    await storageRef.child('category/$fileName').putFile(image);
    final filePath = storageRef.child('category/$fileName').fullPath;
    return filePath;
  }

  @override
  Future<void> delete(String fileName) async {
    await storageRef.child(fileName).delete();
  }
}

@riverpod
CategoryStorageDataSource categoryStorageDataSource(
        CategoryStorageDataSourceRef ref) =>
    CategoryStorageDataSourceImpl();
