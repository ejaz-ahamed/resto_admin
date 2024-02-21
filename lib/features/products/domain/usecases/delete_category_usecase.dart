import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/products/domain/repository/category_repository.dart';

final class DeleteCategoryUseCase {
  final CategoryRepository repository;
  DeleteCategoryUseCase({required this.repository});

  Future<void> call({required String id}) async {
    try {
      final data = await repository.getById(id);
      await repository.deleteStorage(data.name);
      await repository.remove(id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
