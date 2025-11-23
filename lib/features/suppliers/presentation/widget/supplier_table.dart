import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/features/suppliers/data/supplier_model.dart';

class SupplierTable extends StatelessWidget {
  final List<SupplierModel> suppliers;
  final void Function(SupplierModel) onView;

  const SupplierTable({
    super.key,
    required this.suppliers,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingTextStyle: const TextStyle(fontWeight: FontWeight.w600),
        columns: const [
          DataColumn(label: Text("Supplier")),
          DataColumn(label: Text("Category")),
          DataColumn(label: Text("Contact")),
          DataColumn(label: Text("Total Spend")),
          DataColumn(label: Text("Status")),
          DataColumn(label: Text("Actions")),
        ],
        rows: suppliers.map((s) => _buildRow(s)).toList(),
      ),
    );
  }

  DataRow _buildRow(SupplierModel s) {
    return DataRow(
      cells: [
        DataCell(Text(s.name)),

        DataCell(Text(s.category)),

        DataCell(_twoLines(title: s.name, subtitle: s.email)),

        DataCell(Text("\$${s.totalSpend.toStringAsFixed(2)}")),

        DataCell(_statusChip(s.status)),

        DataCell(
          IconButton(
            onPressed: () => onView(s),
            icon: const Icon(FontAwesomeIcons.eye, size: 18),
          ),
        ),
      ],
    );
  }

  Widget _twoLines({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        Text(subtitle, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _statusChip(String status) {
    final Map<String, Color> statusColors = {
      "active": Colors.green,
      "inactive": Colors.orange,
      "suspended": Colors.red,
    };

    final color = statusColors[status.toLowerCase()] ?? Colors.grey;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(
        status,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
