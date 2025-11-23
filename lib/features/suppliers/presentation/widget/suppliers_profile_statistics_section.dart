import 'package:flutter/material.dart';
import 'package:lodgitech/features/suppliers/data/supplier_model.dart';

class SuppliersProfileStatisticsSection extends StatelessWidget {
  final SupplierModel supplier;

  const SuppliersProfileStatisticsSection({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _statItem("${supplier.totalOrders}", "Total Orders"),
            _statItem("\$${supplier.totalSpend.toStringAsFixed(0)}", "Total Spend"),
            _statItem("\$${supplier.avgOrderValue.toStringAsFixed(0)}", "Avg Order Value"),
          ],
        ),
      ),
    );
  }

  Widget _statItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
