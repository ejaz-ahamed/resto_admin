import 'package:resto_admin/features/products/data/repository/category_repository_impl.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';
import 'package:resto_admin/features/products/domain/repository/category_repository.dart';
import 'package:resto_admin/features/products/domain/usecases/add_category_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/delete_category_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/get_categories_usecase.dart';
import 'package:resto_admin/features/products/domain/usecases/update_category_usecase.dart';
import 'package:resto_admin/features/products/presentation/providers/category_provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';

@riverpod
class Category extends _$Category {
  late CategoryRepository repository;
  @override
  CategoryProviderState build() {
    repository = ref.watch(categoryRepositoryProvider);

    return CategoryProviderState(
      categories: GetAllCategoryUseCase(repository: repository)(),
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

  Stream<List<CategoryEntity>> getAll() async* {
    final stream = GetAllCategoryUseCase(repository: repository)();
    await for (final categories in stream) {
      state = state.copyWith(categories: stream);
      yield categories;
    }
  }
}
