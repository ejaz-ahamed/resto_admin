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
  Stream<List<OrderModel>> getAll(OrderStatus orderStatus) async* {
    final orderStream =
        db.where('orderStatus', isEqualTo: orderStatus.name).snapshots();

    await for (final orders in orderStream) {
      yield [for (final order in orders.docs) order.data()];
    }
  }

  @override
  Future<void> updateType(String orderId, OrderStatus newStatus) async {
    await instance
        .collection("orders")
        .doc(orderId)
        .update({'orderStatus': newStatus.name});
  }

  @override
  Future<List<OrderModel>> search(OrderStatus orderStatus) async {
    final orderStream =
        await db.where('orderStatus', isEqualTo: orderStatus.name).get();

    return [for (final order in orderStream.docs) order.data()];
  }
}

@riverpod
OrderFirestoreDataSource orderFirestoreDataSource(
    OrderFirestoreDataSourceRef ref) {
  return OrderFirestoreDataSourceImpl();
}
