import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/billing/data/models/fee_item.dart';
import 'package:lodgitech/features/billing/data/models/invoice.dart';

class InvoiceDetailsTotalSection extends StatelessWidget {
  final Invoice invoice;

  const InvoiceDetailsTotalSection({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          _buildTotalRow('Subtotal', _calculateSubtotal()),
          const SizedBox(height: 8),
          _buildTotalRow('Tax', _calculateTax()),
          const SizedBox(height: 8),
          _buildTotalRow('Service Fee', _calculateServiceFee()),
          const Divider(height: 24),
          _buildTotalRow('TOTAL', invoice.totalAmount, isTotal: true),
        ],
      ),
    );
  }

  Widget _buildTotalRow(String label, double amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.black87 : Colors.grey[700],
          ),
        ),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: isTotal ? 18 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.blue[700] : Colors.black87,
          ),
        ),
      ],
    );
  }

  double _calculateSubtotal() {
    return invoice.fees
        .where((fee) => fee.type != FeeType.taxes)
        .fold(0, (sum, fee) => sum + fee.amount);
  }

  double _calculateTax() {
    return invoice.fees
        .where((fee) => fee.type == FeeType.taxes)
        .fold(0, (sum, fee) => sum + fee.amount);
  }

  double _calculateServiceFee() {
    return 0.0;
  }
}
