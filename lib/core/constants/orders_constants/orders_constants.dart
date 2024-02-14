import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orders_constants.g.dart';

final class OrderpageConstants {
  final String txtorderDetails = 'Order Details';
  final String txtprint = 'Print';
  final String txtorderId = 'Order ID';
  final String txtcustomerName = 'Customer Name';
  final String txttime = 'Time';
  final String txtlocation = 'Location';
  final String txtitems = 'Items';
  final String txttype = 'Type';
  final String txtquantity = 'Quantity';
  final String txtprice = 'Price';
  final String txttotal = 'Total';
  final String txtorders = 'Orders';
  final String txtpreparing = 'Preparing';
  final String txtcompleted = 'Completed';
  final String txtRejct = 'Reject';
  final String txtAccept = 'Accept';
}

@riverpod
OrderpageConstants orderpageConstants(OrderpageConstantsRef ref) {
  return OrderpageConstants();
}
