import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/products/domain/repository/category_repository.dart';

final class DeleteManyCategoryUseCase {
  final CategoryRepository repository;

  DeleteManyCategoryUseCase({required this.repository});

  Future<void> call({required List<String> docIdsToDelete}) async {
    try {
      for (final docId in docIdsToDelete) {
        final category = await repository.getById(docId);
        repository.deleteStorage(category.name);
      }
      await repository.deleteMany(docIdsToDelete);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
