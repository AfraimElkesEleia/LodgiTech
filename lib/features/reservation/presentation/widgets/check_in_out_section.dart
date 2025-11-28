import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/widgets/custom_date_field.dart';

class CheckInOutSection extends StatelessWidget {
  final DateTime? checkIn;
  final DateTime? checkOut;
  final Function(DateTime) onCheckInSelected;
  final Function(DateTime) onCheckOutSelected;

  const CheckInOutSection({
    super.key,
    required this.checkIn,
    required this.checkOut,
    required this.onCheckInSelected,
    required this.onCheckOutSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: CustomDateField(
              label: "Check In",
              date: checkIn,
              onDateSelected: onCheckInSelected,
              validator: (_) => checkIn == null ? 'Please select check-in date' : null,
            ),
          ),
          horizontalSpace(14),
          Expanded(
            child: CustomDateField(
              label: "Check Out",
              date: checkOut,
              onDateSelected: onCheckOutSelected,
              validator: (_) {
                if (checkOut == null) return 'Please select check-out date';
                if (checkIn != null && checkOut!.isBefore(checkIn!)) {
                  return 'Check-out must be after check-in';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
