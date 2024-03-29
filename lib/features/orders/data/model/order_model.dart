import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/features/orders/data/model/order_item_model.dart';
part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const OrderModel._();
  factory OrderModel({
    required String id,
    required String uid,
    required String location,
    required String time,
    required List<OrderItemModel> items,
    required OrderStatus orderStatus,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  factory OrderModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    data['id'] = snapshot.id;
    return OrderModel.fromJson(data);
  }

  Map<String, dynamic> toFirestore() {
    return toJson()..remove('id');
  }
}
