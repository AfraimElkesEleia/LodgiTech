import 'package:flutter/material.dart';

class LoyaltyTag extends StatelessWidget {
  final String tier;

  const LoyaltyTag({super.key, required this.tier});

  Color _getColor(String tier) {
    switch (tier.toLowerCase()) {
      case "gold":
        return Colors.amber.shade700;
      case "silver":
        return Colors.blueGrey;
      case "platinum":
        return Colors.blue;
      case "bronze":
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor(tier);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(
        tier,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
