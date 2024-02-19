import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/features/orders/data/datasource/order_datasource.dart';
import 'package:resto_admin/features/orders/data/model/order_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'order_datasource_impl.g.dart';

class OrderFirestoreDataSourceImpl implements OrderFirestoreDataSource {
  final instance = FirebaseFirestore.instance;
  final db = FirebaseFirestore.instance.collection("orders").withConverter(
      fromFirestore: OrderModel.fromFirestore,
      toFirestore: (model, _) => model.toFirestore());

  @override
  Stream<List<OrderModel>> getAll(OrderType orderType) async* {
    final orderStream = db.where('type', isEqualTo: orderType.name).snapshots();

    await for (final orders in orderStream) {
      yield [for (final order in orders.docs) order.data()];
    }
  }

  @override
  Future<void> updateType(String orderId, OrderType newType) async {
    await instance
        .collection("orders")
        .doc(orderId)
        .update({'type': newType.name});
  }
}

@riverpod
OrderFirestoreDataSource orderFirestoreDataSource(
    OrderFirestoreDataSourceRef ref) {
  return OrderFirestoreDataSourceImpl();
}
