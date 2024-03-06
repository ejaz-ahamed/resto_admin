// ignore_for_file: unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'condition_model.freezed.dart';
part 'condition_model.g.dart';

enum ConditionType {
  count,
  amount;
}

enum ConditionCheck {
  equalTo,
  greaterThan,
  lessThan,
}

enum ConditionLogic {
  and,
  or,
}

@freezed
class Condition with _$Condition {
  const Condition._();

  factory Condition({
    required ConditionType count,
    required ConditionCheck check,
    required ConditionLogic logic,
    required double value,
  }) = _Condition;

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  factory Condition.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Condition.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
