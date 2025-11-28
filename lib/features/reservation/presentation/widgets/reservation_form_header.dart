import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';

class ReservationFormHeader extends StatelessWidget {
  final bool isEdit;

  const ReservationFormHeader({super.key, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isEdit ? "Edit Reservation" : "New Reservation",
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
        ),
        verticalSpace(12),
        Text(
          isEdit
              ? "Update the guest reservation details"
              : "Add a new guest reservation to the system",
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        verticalSpace(12),
      ],
    );
  }
}
