
import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/billing/data/models/invoice.dart';

class InvoiceDetailsStaySection extends StatelessWidget {
  final Invoice invoice;

  const InvoiceDetailsStaySection({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Stay Details',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow('Check-in', _formatDate(invoice.from)),
          const SizedBox(height: 8),
          _buildInfoRow('Check-out', _formatDate(invoice.to)),
          const SizedBox(height: 8),
          _buildInfoRow(
            'Duration',
            '${invoice.to.difference(invoice.from).inDays} nights',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
