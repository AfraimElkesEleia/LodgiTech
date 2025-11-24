import 'package:flutter/material.dart';

class SubmitReservationButton extends StatelessWidget {
  final bool isEditMode;
  final VoidCallback onSubmit;

  const SubmitReservationButton({
    super.key,
    required this.isEditMode,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSubmit,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: const Size(double.infinity, 25),
      ),
      child: Text(
        isEditMode ? "Update Reservation" : "Create Reservation",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
