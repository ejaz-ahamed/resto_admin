
import 'dart:io';

abstract class ProfileStorageDataSource{
  Future<String>addImage(File image);
  Future<void>deleteImage();
  
}