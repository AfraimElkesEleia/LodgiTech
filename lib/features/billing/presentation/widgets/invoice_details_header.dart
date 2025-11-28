import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/billing/data/models/invoice.dart';
import 'package:lodgitech/features/billing/data/models/invoice_status.dart';

class InvoiceHeader extends StatelessWidget {
  final Invoice invoice;

  const InvoiceHeader({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'INVOICE #${invoice.id}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _formatDate(DateTime.now()),
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _getStatusColor(invoice.status).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _getStatusColor(invoice.status),
                width: 1,
              ),
            ),
            child: Text(
              _getStatusText(invoice.status),
              style: TextStyle(
                color: _getStatusColor(invoice.status),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Color _getStatusColor(InvoiceStatus? status) {
    switch (status) {
      case InvoiceStatus.paid:
        return Colors.green;
      case InvoiceStatus.pending:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(InvoiceStatus? status) {
    switch (status) {
      case InvoiceStatus.paid:
        return 'PAID';
      case InvoiceStatus.pending:
        return 'PENDING';
      default:
        return 'NOT PAID';
    }
  }
}