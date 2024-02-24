abstract class UserStorageDataSource{
  Future<String> upload(String userId, String imagePath);
  Future<void> delete(String userId);
}