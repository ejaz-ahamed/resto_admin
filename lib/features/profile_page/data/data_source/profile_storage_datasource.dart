
import 'dart:io';

abstract class ProfileStorageDataSource{
  Future<String>addImage(File image);
  Stream<void>getImage(String image);
}