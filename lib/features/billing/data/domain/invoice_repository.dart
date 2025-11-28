import 'package:lodgitech/features/billing/data/models/fee_item.dart';

abstract class InvoiceRepository {
  Future<void> addFee(String invoiceId, FeeItem fee);
}
