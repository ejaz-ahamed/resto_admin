import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/core/utils/firebase_storage_utils.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';
import 'package:resto_admin/features/products/domain/repository/category_repository.dart';

final class GetAllCategoryUseCase {
  final CategoryRepository repository;
  GetAllCategoryUseCase({required this.repository});

  Stream<List<CategoryEntity>> call() async* {
    try {
      final categoriesStream = repository.getAll();

      await for (final categories in categoriesStream) {
        yield [
          for (final category in categories)
            CategoryEntity(
              id: category.id,
              imagePath:
                  await FirebaseStorageUtils.getDownloadUrl(category.imagePath),
              name: category.name,
            )
        ];
      }
    } catch (e) {
      throw BaseException('Data not found');
    }
  }
}
