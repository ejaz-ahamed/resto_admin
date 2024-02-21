import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  factory UserEntity({
    required String uid,
    required String name,
    required String imgPath,
  }) = _UserEntity;
}
