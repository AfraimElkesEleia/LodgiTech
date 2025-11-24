import 'package:flutter/material.dart';

enum FeeType {
  roomService,
  laundry,
  spaTreatment,
  minibar,
  roomCharges,
  taxes,
  other,
}

extension FeeTypeExt on FeeType {
  String get label {
    switch (this) {
      case FeeType.roomService:
        return "Room Service";
      case FeeType.roomCharges:
        return "Room Charges";
      case FeeType.taxes:
        return "Taxes";
      case FeeType.laundry:
        return "Laundry";
      case FeeType.spaTreatment:
        return "Spa Treatment";
      case FeeType.minibar:
        return "Minibar";
      case FeeType.other:
        return "Other";
    }
  }

  IconData get icon {
    switch (this) {
      case FeeType.roomService:
        return Icons.room_service;
      case FeeType.roomCharges:
        return Icons.ac_unit;
      case FeeType.taxes:
        return Icons.money;
      case FeeType.laundry:
        return Icons.local_laundry_service;
      case FeeType.spaTreatment:
        return Icons.spa;
      case FeeType.minibar:
        return Icons.local_drink;
      case FeeType.other:
        return Icons.miscellaneous_services;
    }
  }
}

class FeeItem {
  final FeeType type;
  final double amount;

  FeeItem({required this.type, required this.amount});
}
