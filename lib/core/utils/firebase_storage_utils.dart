import 'package:firebase_storage/firebase_storage.dart';

final class FirebaseStorageUtils {
  static Future<String> getDownloadUrl(String filePath) async {
    return await FirebaseStorage.instance
        .ref()
        .child(filePath)
        .getDownloadURL();
  }
}
