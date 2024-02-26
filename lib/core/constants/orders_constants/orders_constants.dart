import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orders_constants.g.dart';

final class OrderpageConstants {
  final String txtOrderDetails = 'Order Details';
  final String txtPrint = 'Print';
  final String txtOrderId = 'Order ID';
  final String txtCustomerName = 'Customer Name';
  final String txtTime = 'Time';
  final String txtLocation = 'Location';
  final String txtItems = 'Items';
  final String txtType = 'Type';
  final String txtQuantity = 'Quantity';
  final String txtPrice = 'Price';
  final String txtTotal = 'Total';
  final String txtOrders = 'Orders';
  final String txtPreparing = 'Preparing';
  final String txtCompleted = 'Completed';
  final String txtRejct = 'Reject';
  final String txtAccept = 'Accept';
  final String txtSearch = 'Search';
  final String txtNoOrders = 'No orders';
  final String txtMarkCompletedBtnLabel = 'Completed';
  final String txtMoveToPreparing = 'Move To Preparing';
  final String txtMoveToOrder = 'Move To Orders';
}

@riverpod
OrderpageConstants orderpageConstants(OrderpageConstantsRef ref) {
  return OrderpageConstants();
}
