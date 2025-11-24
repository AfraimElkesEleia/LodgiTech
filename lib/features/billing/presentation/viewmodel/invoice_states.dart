import 'package:lodgitech/features/billing/data/models/invoice.dart';

abstract class InvoiceStates {
  final List<Invoice> invoices;
  
  const InvoiceStates({required this.invoices});
}

class AddFeeInitial extends InvoiceStates {
  const AddFeeInitial({required super.invoices});
}

class AddFeeLoading extends InvoiceStates {
  const AddFeeLoading({required super.invoices});
}

class AddFeeSuccess extends InvoiceStates {
  const AddFeeSuccess({required super.invoices});
}

class AddFeeError extends InvoiceStates {
  final String message;
  
  const AddFeeError(this.message, {required super.invoices});
}