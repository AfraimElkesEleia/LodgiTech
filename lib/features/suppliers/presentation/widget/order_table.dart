import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/features/suppliers/data/order_model.dart'; 

class OrdersTable extends StatelessWidget {
  final List<OrderModel> orders;
  final void Function(OrderModel) onView;

  const OrdersTable({
    super.key,
    required this.orders,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingTextStyle: const TextStyle(fontWeight: FontWeight.w600),
        columns: const [
          DataColumn(label: Text("Order ID")),
          DataColumn(label: Text("Supplier")),
          DataColumn(label: Text("Order Date")),
          DataColumn(label: Text("Delivery Date")),
          DataColumn(label: Text("Status")),
          DataColumn(label: Text("Total")),
          DataColumn(label: Text("Actions")),
        ],
        rows: orders.map((o) => _buildRow(o)).toList(),
      ),
    );
  }

  DataRow _buildRow(OrderModel o) {
    return DataRow(
      cells: [
        DataCell(Text(o.id)),
        DataCell(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(o.supplierName, style: const TextStyle(fontWeight: FontWeight.w600)),
            Text(o.supplierEmail, style: const TextStyle(color: Colors.grey)),
          ],
        )),
        DataCell(Text(_formatDate(o.orderDate))),
        DataCell(Text(_formatDate(o.deliveryDate))),
        DataCell(_statusChip(o.status)),
        DataCell(Text("\$${o.total.toStringAsFixed(2)}")),
        DataCell(
          IconButton(
            icon: const Icon(FontAwesomeIcons.eye, color: Colors.blue),
            onPressed: () => onView(o),
          ),
        ),
      ],
    );
  }

  Widget _statusChip(String status) {
    final Map<String, Color> statusColors = {
      "pending": Colors.orange,
      "confirmed": Colors.green,
      "delivered": Colors.blue,
      "cancelled": Colors.red,
    };

    final color = statusColors[status.toLowerCase()] ?? Colors.grey;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(
        status,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.month}/${date.day}/${date.year}";
  }
}
