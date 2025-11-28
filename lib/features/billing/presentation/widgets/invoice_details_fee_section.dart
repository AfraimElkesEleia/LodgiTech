
import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/billing/data/models/fee_item.dart';

class InvoiceDetailsFeeSection extends StatelessWidget {
  final List<FeeItem> fees;

  const InvoiceDetailsFeeSection({super.key, required this.fees});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fee Breakdown',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          ...fees.map((fee) => _buildFeeItem(fee)).toList(),
        ],
      ),
    );
  }

  Widget _buildFeeItem(FeeItem fee) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(fee.type.icon, size: 20, color: Colors.blue[700]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fee.type.label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Service charge',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Text(
            '\$${fee.amount.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}