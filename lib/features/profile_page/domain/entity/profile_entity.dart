import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity.freezed.dart';

@freezed
class ProfileEntity with _$ProfileEntity {
  factory ProfileEntity({
    required String? openingTime,
    required String? closingTime,
  }) = _ProfileEntity;
}
