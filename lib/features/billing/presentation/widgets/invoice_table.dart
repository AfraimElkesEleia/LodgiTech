import 'package:flutter/material.dart';
import 'package:lodgitech/features/billing/data/models/invoice.dart';
import 'package:lodgitech/features/billing/data/models/invoice_status.dart';

class InvoiceTable extends StatelessWidget {
  final List<Invoice> invoices;
  final void Function(Invoice) onViewInvoice;
  final void Function(Invoice) onAddFees;

  const InvoiceTable({
    super.key,
    required this.invoices,
    required this.onViewInvoice,
    required this.onAddFees,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingTextStyle: const TextStyle(fontWeight: FontWeight.w600),
        columns: const [
          DataColumn(label: Text("Invoice ID")),
          DataColumn(label: Text("Guest")),
          DataColumn(label: Text("Room")),
          DataColumn(label: Text("Stay Period")),
          DataColumn(label: Text("Total Amount")),
          DataColumn(label: Text("Status")),
          DataColumn(label: Text("Payment Method")),
          DataColumn(label: Text("Actions")),
        ],
        rows: invoices.map((invoice) => _buildRow(invoice)).toList(),
      ),
    );
  }

  DataRow _buildRow(Invoice i) {
    return DataRow(
      cells: [
        DataCell(Text(i.id)),

        DataCell(_twoLines(title: i.guestName, subtitle: i.guestEmail)),

        DataCell(_twoLines(title: i.room, subtitle: i.roomType)),

        DataCell(
          _twoLines(title: _formatDate(i.from), subtitle: _formatDate(i.to)),
        ),

        DataCell(Text("\$${i.totalAmount.toStringAsFixed(2)}")),

        DataCell(_statusChip(i.status)),

        DataCell(Text(i.paymentMethod ?? "Not Paid")),

        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.receipt_long, color: Colors.blue),
                onPressed: () => onViewInvoice(i),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.green),
                onPressed: () => onAddFees(i),
              ),
            ],
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

  Widget _statusChip(InvoiceStatus status) {
    final color = status.color;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(
        status.label,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.month}/${date.day}/${date.year}";
  }
}
