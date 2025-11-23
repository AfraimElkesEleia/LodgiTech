class OrderModel {
  final String id;
  final String supplierName;
  final String supplierEmail;
  final DateTime orderDate;
  final DateTime deliveryDate;
  final String status;
  final double total;

  OrderModel({
    required this.id,
    required this.supplierName,
    required this.supplierEmail,
    required this.orderDate,
    required this.deliveryDate,
    required this.status,
    required this.total,
  });
}
