import 'dart:io';

abstract class OfferStorageDataSource {
  Future<String> add(File image, String fileName);
}
