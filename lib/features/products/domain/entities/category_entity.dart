import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';

@freezed
class CategoryEntity with _$CategoryEntity {
  factory CategoryEntity({
    required String id,
    required String imagePath,
    required String name,
  }) = _CategoryEntity;
}
