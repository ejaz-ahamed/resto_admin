enum OrderType {
  order("ORDER"),
  preparing("PERCENTAGE"),
  completed("COMPLETED"),
  rejected("REJECTED");

  final String orderType;
  const OrderType(this.orderType);
}
