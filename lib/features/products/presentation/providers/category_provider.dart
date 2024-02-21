import 'package:resto_admin/features/products/data/repository/category_repository_impl.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';
import 'package:resto_admin/features/products/domain/repository/category_repository.dart';
import 'package:resto_admin/features/products/domain/usecases/add_category_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/delete_category_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/deletemany_category_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/get_categories_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/update_category_usecase.dart';
import 'package:resto_admin/features/products/presentation/providers/category_provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';

@Riverpod(keepAlive: true)
class Category extends _$Category {
  late CategoryRepository repository;
  @override
  CategoryProviderState build() {
    repository = ref.read(categoryRepositoryProvider);

    return CategoryProviderState(
      selectedCategory: '',
    );
  }

  Future<void> add(
      {required String id,
      required String imagePath,
      required String name}) async {
    await AddCategoryUseCase(repository: repository)(
      id: id,
      imagePath: imagePath,
      name: name,
    );
  }

  Future<void> remove({required String id}) async {
    await DeleteCategoryUseCase(repository: repository)(id: id);
  }

  Future<void> updateCategory({
    required String id,
    required String imagePath,
    required String name,
  }) async {
    await UpdateCategoryUseCase(repository: repository)(
        id: id, imagePath: imagePath, name: name);
  }

  void selectCategory(String id) {
    state = state.copyWith(selectedCategory: id);
  }

  Future<void> deleteMany({required List<String> docIdsToDelete}) async {
    await DeleteManyCategoryUseCase(repository: repository)(
        docIdsToDelete: docIdsToDelete);
  }
}

@riverpod
Stream<List<CategoryEntity>> getAllCategory(GetAllCategoryRef ref) {
  final repository = ref.read(categoryRepositoryProvider);
  return GetAllCategoryUseCase(repository: repository)();
}
