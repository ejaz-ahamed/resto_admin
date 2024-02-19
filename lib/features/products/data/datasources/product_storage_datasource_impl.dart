import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:resto_admin/features/products/data/datasources/product_storage_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_storage_datasource_impl.g.dart';

class ProductStorageDataSourceImpl implements ProductStorageDataSource {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> add(File image, String fileName) async {
    await storageRef.child('product/$fileName').putFile(image);
    final filePath = storageRef.child('product/$fileName').fullPath;
    return filePath;
  }

  @override
  Future<void> delete(String fileName) async {
    await storageRef.child(fileName).delete();
  }
}

@riverpod
ProductStorageDataSource productStorageDataSource(
    ProductStorageDataSourceRef ref) {
  return ProductStorageDataSourceImpl();
}
