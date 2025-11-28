class BillingBreakdown {
  final double roomCharges;
  final double roomService;
  final double laundry;
  final double spaTreatment;
  final double taxes;

  BillingBreakdown({
    this.roomCharges = 0.0,
    this.roomService = 0.0,
    this.laundry = 0.0,
    this.spaTreatment = 0.0,
    this.taxes = 0.0,
  });

  double get subtotal =>
      roomCharges + roomService + laundry + spaTreatment;

  double get total => subtotal + taxes;
}
