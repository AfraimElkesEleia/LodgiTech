

import 'package:lodgitech/features/billing/data/domain/invoice_repository.dart';
import 'package:lodgitech/features/billing/data/models/fee_item.dart';

class AddFeeToInvoiceUseCase {
  final InvoiceRepository repository;

  AddFeeToInvoiceUseCase({required this.repository});

  Future<void> call(String invoiceId, FeeItem item) async {
    return repository.addFee(invoiceId, item);
  }
}
