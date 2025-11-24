
import 'package:flutter/material.dart';
import 'package:lodgitech/features/billing/data/models/invoice.dart';
import 'package:lodgitech/features/billing/data/models/invoice_status.dart';

class InvoiceActionButtons extends StatelessWidget {
  final Invoice invoice;
  final VoidCallback onGeneratePDF;
  final VoidCallback onProceedPayment;
  final VoidCallback? onMarkAsPaid;

  const InvoiceActionButtons({
    super.key,
    required this.invoice,
    required this.onGeneratePDF,
    required this.onProceedPayment,
    this.onMarkAsPaid,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // PDF Button
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onGeneratePDF,
            icon: const Icon(Icons.download, size: 20),
            label: const Text(
              'PDF',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),

        // Proceed/Mark as Paid Button
        if (invoice.status != InvoiceStatus.paid) ...[
          Expanded(
            child: ElevatedButton(
              onPressed: onProceedPayment,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                invoice.status == InvoiceStatus.pending
                    ? 'Proceed to Pay'
                    : 'Mark as Paid',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ],
    );
  }
}