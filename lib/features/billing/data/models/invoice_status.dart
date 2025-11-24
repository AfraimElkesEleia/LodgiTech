import 'package:flutter/material.dart';

enum InvoiceStatus { pending, paid }

extension InvoiceStatusExt on InvoiceStatus {
  String get label {
    switch (this) {
      case InvoiceStatus.pending:
        return "Pending";
      case InvoiceStatus.paid:
        return "Paid";
    }
  }

  Color get color {
    switch (this) {
      case InvoiceStatus.pending:
        return Colors.orange;
      case InvoiceStatus.paid:
        return Colors.green;
    }
  }
}
