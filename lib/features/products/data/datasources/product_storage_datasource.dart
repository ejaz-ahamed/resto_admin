import 'dart:io';

abstract class ProductStorageDataSource {
  Future<String> add(File image, String fileName);
  Future<void> delete(String fileName);
}
