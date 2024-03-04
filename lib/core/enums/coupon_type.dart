enum CouponType {
  amount('AMOUNT'),
  percentage('PERCENTAGE'),
  freeDelivery('');

  final String couponType;
  const CouponType(this.couponType);
}
