import 'package:flutter/material.dart';

class NightsSummary extends StatelessWidget {
  final DateTime? checkIn;
  final DateTime? checkOut;

  const NightsSummary({
    super.key,
    required this.checkIn,
    required this.checkOut,
  });

  @override
  Widget build(BuildContext context) {
    if (checkIn == null || checkOut == null) return SizedBox.shrink();

    final nights = checkOut!.difference(checkIn!).inDays;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        'Duration: $nights nights',
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
