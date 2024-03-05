import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/features/coupons/data/models/condition_model.dart';

part 'condition_entity.freezed.dart';

@freezed
class ConditionEntity with _$ConditionEntity {
  factory ConditionEntity({
    required ConditionType count,
    required ConditionCheck check,
    required ConditionLogic logic,
    required double value,
  }) = _ConditionEntity;
}
