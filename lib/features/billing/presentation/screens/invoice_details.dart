import 'package:flutter/material.dart';
import 'package:lodgitech/features/billing/data/models/invoice.dart';
import 'package:lodgitech/features/billing/presentation/widgets/invoice_action_button.dart';
import 'package:lodgitech/features/billing/presentation/widgets/invoice_details_fee_section.dart';
import 'package:lodgitech/features/billing/presentation/widgets/invoice_details_guest_info_section.dart';
import 'package:lodgitech/features/billing/presentation/widgets/invoice_details_header.dart';
import 'package:lodgitech/features/billing/presentation/widgets/invoice_details_stay_section.dart';
import 'package:lodgitech/features/billing/presentation/widgets/invoice_details_total_section.dart';

class InvoiceDetailsScreen extends StatelessWidget {
  final Invoice invoice;

  const InvoiceDetailsScreen({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice Details'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InvoiceHeader(invoice: invoice),
            const SizedBox(height: 16),

            InvoiceDetailsGuestInfoSection(invoice: invoice),
            const SizedBox(height: 16),

            InvoiceDetailsStaySection(invoice: invoice),
            const SizedBox(height: 16),

            InvoiceDetailsFeeSection(fees: invoice.fees),
            const SizedBox(height: 16),

            InvoiceDetailsTotalSection(invoice: invoice),
            const SizedBox(height: 24),

            InvoiceActionButtons(
              invoice: invoice,
              onGeneratePDF: () {},
              onProceedPayment: () {},
              onMarkAsPaid: () {},
            ),
          ],
        ),
      ),
    );
  }
}
