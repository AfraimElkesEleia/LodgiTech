class OrderItem {
  final String productName;
  final String quantity;
  final double price;

  OrderItem({
    required this.productName,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
    'productName': productName,
    'quantity': quantity,
    'price': price,
  };

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    productName: json['productName'],
    quantity: json['quantity'],
    price: json['price']?.toDouble(),
  );
}

class OrderModel {
  final String id;
  final String supplierName;
  final String supplierEmail;
  final DateTime orderDate;
  final DateTime deliveryDate;
  final String status;
  final double total;
  final List<OrderItem> items;
  final double subtotal;
  final double tax;
  final String notes;
  final String? supplierAddress;
  final String? paymentTerms;

  OrderModel({
    required this.id,
    required this.supplierName,
    required this.supplierEmail,
    required this.orderDate,
    required this.deliveryDate,
    required this.status,
    required this.total,
    required this.items,
    required this.subtotal,
    required this.tax,
    required this.notes,
    this.supplierAddress,
    this.paymentTerms,
  });

  factory OrderModel.fromItems({
    required String id,
    required String supplierName,
    required String supplierEmail,
    required DateTime orderDate,
    required DateTime deliveryDate,
    required String status,
    required List<OrderItem> items,
    required String notes,
    double taxRate = 0.08, 
    String? supplierAddress,
    String? paymentTerms,
  }) {
    final subtotal = items.fold(0.0, (sum, item) => sum + item.price);
    final tax = subtotal * taxRate;
    final total = subtotal + tax;

    return OrderModel(
      id: id,
      supplierName: supplierName,
      supplierEmail: supplierEmail,
      orderDate: orderDate,
      deliveryDate: deliveryDate,
      status: status,
      total: total,
      items: items,
      subtotal: subtotal,
      tax: tax,
      notes: notes,
      supplierAddress: supplierAddress,
      paymentTerms: paymentTerms,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'supplierName': supplierName,
    'supplierEmail': supplierEmail,
    'orderDate': orderDate.toIso8601String(),
    'deliveryDate': deliveryDate.toIso8601String(),
    'status': status,
    'total': total,
    'items': items.map((item) => item.toJson()).toList(),
    'subtotal': subtotal,
    'tax': tax,
    'notes': notes,
    'supplierAddress': supplierAddress,
    'paymentTerms': paymentTerms,
  };
}