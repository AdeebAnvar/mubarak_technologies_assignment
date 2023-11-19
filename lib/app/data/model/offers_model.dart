class OffersModel {
  OffersModel({
    this.name,
    this.flatDiscount,
    this.offPercent,
  });
  String? name;
  double? flatDiscount;
  double? offPercent;

  double getDiscountedPrice(double originalPrice) {
    if (flatDiscount != null && flatDiscount! > 0) {
      return originalPrice - flatDiscount!;
    } else if (offPercent != null && offPercent! > 0) {
      return originalPrice - (originalPrice * offPercent! / 100);
    } else {
      return originalPrice;
    }
  }
}
