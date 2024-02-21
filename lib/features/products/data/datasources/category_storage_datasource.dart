import 'dart:io';

abstract class CategoryStorageDataSource {
  Future<String> add(File image, String fileName);
  Future<void> delete(String fileName);
}
