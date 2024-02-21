import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:resto_admin/features/offer/data/datasource/offer_storage_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'offer_storage_datasource_impl.g.dart';
class OfferStorageDataSourceImpl implements OfferStorageDataSource {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> add(File image, String fileName) async {
    await storageRef.child('offer/$fileName').putFile(image);
    final filePath = storageRef.child('offer/$fileName').fullPath;
    return filePath;
  }
  
  @override
  Future<void> deleteStorage(String fileNmae) async{
    await storageRef.child('offer/$fileNmae').delete();
  }
  
 
}
@riverpod
OfferStorageDataSource offerStorageDataSource(OfferStorageDataSourceRef ref) =>
    OfferStorageDataSourceImpl();