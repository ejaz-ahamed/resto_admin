import 'dart:io';

abstract class CategoryStorageDataSource {
  Future<String> add(File image, String fileName);
}
