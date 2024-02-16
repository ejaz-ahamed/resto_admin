import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_admin/features/profile_page/data/datasource/profile_firestore_datasource.dart';
import 'package:resto_admin/features/profile_page/data/model/profile_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'profile_firestore_datasource_impl.g.dart';
class ProfileFirestoreDataSourceImpl implements ProfileFirestoreDataSource {
  final collection = FirebaseFirestore.instance
      .collection('admin_profile')
      .withConverter(
          fromFirestore: ProfileModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());
  @override
  Future<void> addOpeningTime(ProfileModel model) async {
  await collection.add(model);
  }
}
@riverpod
ProfileFirestoreDataSource profileFirestoreDataSource(ProfileFirestoreDataSourceRef ref){
  return ProfileFirestoreDataSourceImpl();
}
