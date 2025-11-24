import 'package:lodgitech/features/billing/data/models/fee_item.dart';
import 'package:lodgitech/features/billing/data/models/invoice_status.dart';

class Invoice {
  final String id;
  final String guestName;
  final String guestEmail;
  final String room;
  final String roomType;
  final DateTime from;
  final DateTime to;
  final InvoiceStatus status;
  final List<FeeItem> fees;
  final String? paymentMethod;

  Invoice({
    required this.id,
    required this.guestName,
    required this.guestEmail,
    required this.room,
    required this.roomType,
    required this.from,
    required this.to,
    required this.status,
    required this.fees,
    this.paymentMethod,
  });

  double get totalAmount => fees.fold(0, (sum, fee) => sum + fee.amount);
  // Add this to your Invoice model
Invoice copyWith({
  String? id,
  String? guestName,
  String? guestEmail,
  String? room,
  String? roomType,
  DateTime? from,
  DateTime? to,
  InvoiceStatus? status,
  List<FeeItem>? fees,
  String? paymentMethod,
}) {
  return Invoice(
    id: id ?? this.id,
    guestName: guestName ?? this.guestName,
    guestEmail: guestEmail ?? this.guestEmail,
    room: room ?? this.room,
    roomType: roomType ?? this.roomType,
    from: from ?? this.from,
    to: to ?? this.to,
    status: status ?? this.status,
    fees: fees ?? this.fees,
    paymentMethod: paymentMethod ?? this.paymentMethod,
  );
}
}