import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lodgitech/features/billing/data/domain/use_case/add_fee_use_case.dart';
import 'package:lodgitech/features/billing/data/models/fee_item.dart';
import 'package:lodgitech/features/billing/data/models/invoice.dart';
import 'package:lodgitech/features/billing/presentation/viewmodel/invoice_states.dart';

class InvoiceCubit extends Cubit<InvoiceStates> {
  final AddFeeToInvoiceUseCase addFeeUseCase;
  List<Invoice> _invoices = [];

  InvoiceCubit(this.addFeeUseCase, {List<Invoice>? initialInvoices}) 
      : _invoices = initialInvoices ?? [],
        super(AddFeeInitial(invoices: initialInvoices ?? []));

  List<Invoice> get invoices => _invoices;

  Future<void> addFee(String invoiceId, FeeItem item) async {
    emit(AddFeeLoading(invoices: _invoices));
    try {
      await addFeeUseCase.call(invoiceId, item);
      
      // Update the local invoices list
      _updateInvoiceList(invoiceId, item);
      
      emit(AddFeeSuccess(invoices: _invoices));
    } catch (e) {
      emit(AddFeeError(e.toString(), invoices: _invoices));
    }
  }

  void _updateInvoiceList(String invoiceId, FeeItem newFee) {
    final invoiceIndex = _invoices.indexWhere((inv) => inv.id == invoiceId);
    if (invoiceIndex != -1) {
      // Create a new invoice with updated fees to maintain immutability
      final updatedInvoice = _invoices[invoiceIndex].copyWith(
        fees: List<FeeItem>.from(_invoices[invoiceIndex].fees)..add(newFee),
      );
      _invoices[invoiceIndex] = updatedInvoice;
    }
  }

  // Optional: Method to refresh invoices from repository
  void refreshInvoices(List<Invoice> updatedInvoices) {
    _invoices = updatedInvoices;
    emit(AddFeeInitial(invoices: _invoices));
  }
}