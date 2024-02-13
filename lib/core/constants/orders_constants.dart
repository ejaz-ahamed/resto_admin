import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orders_constants.g.dart';

final class OrderpageConstants {
  final String orderDetails = 'Order Details';
  final String print = 'Print';
  final String orderId = 'Order ID';
  final String customerName = 'Customer Name';
  final String time = 'Time';
  final String location = 'Location';
  final String items = 'Items';
  final String type = 'Type';
  final String quantity = 'Quantity';
  final String price = 'Price';
  final String total = 'Total';
}

@riverpod
OrderpageConstants orderpageConstants(OrderpageConstantsRef ref) {
  return OrderpageConstants();
}