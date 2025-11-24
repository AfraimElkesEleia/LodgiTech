import 'package:lodgitech/features/billing/data/domain/invoice_repository.dart';
import 'package:lodgitech/features/billing/data/models/fee_item.dart';
import 'package:lodgitech/features/billing/data/models/invoice.dart';

class InvoiceRepositoryImpl implements InvoiceRepository {
  final List<Invoice> _invoices;

  InvoiceRepositoryImpl({List<Invoice>? initialInvoices})
      : _invoices = initialInvoices ?? [];

  @override
  Future<List<Invoice>> addFee(String invoiceId, FeeItem fee) async {
    final invoiceIndex = _invoices.indexWhere((inv) => inv.id == invoiceId);
    if (invoiceIndex == -1) {
      throw Exception("Invoice not found");
    }
    
    final updatedInvoice = _invoices[invoiceIndex].copyWith(
      fees: List<FeeItem>.from(_invoices[invoiceIndex].fees)..add(fee),
    );
    
    _invoices[invoiceIndex] = updatedInvoice;

    await Future.delayed(const Duration(milliseconds: 200));
    
    return List<Invoice>.from(_invoices);
  }

  @override
  List<Invoice> getInvoices() => List<Invoice>.from(_invoices);
}