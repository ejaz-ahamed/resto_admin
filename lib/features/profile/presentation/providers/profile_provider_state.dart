import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/features/profile/domain/entity/profile_entity.dart';

part 'profile_provider_state.freezed.dart';

@freezed
class ProfileProviderState with _$ProfileProviderState {
  factory ProfileProviderState(
      {required ProfileEntity profileEntity,
      required bool switchButton}) = _ProfileProviderState;
}
