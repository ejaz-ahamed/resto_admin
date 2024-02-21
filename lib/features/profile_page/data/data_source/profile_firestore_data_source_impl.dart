import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_admin/features/profile_page/data/data_source/profile_firestore_data_source.dart';
import 'package:resto_admin/features/profile_page/data/model/profile_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_firestore_data_source_impl.g.dart';

class ProfileFirestoreDataSourceImpl implements ProfileFirestoreDataSource {
  final collection = FirebaseFirestore.instance
      .collection('admin_profile')
      .withConverter(
          fromFirestore: ProfileModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());
  @override
  Future<void> setTime(ProfileModel profileModel) async {
    collection.doc('restaurant_time').set(profileModel);
  }

  @override
  Stream<ProfileModel> getTime() async* {
    final modelStream = collection.doc("restaurant_time").snapshots();
    await for (var restoTime in modelStream) {
      yield restoTime.data()!;
    }
  }
}

@riverpod
ProfileFirestoreDataSource profileFirestoreDataSource(
    ProfileFirestoreDataSourceRef ref) {
  return ProfileFirestoreDataSourceImpl();
}
