import 'package:flutter/material.dart';
import 'package:lodgitech/features/dashboard/data/models/quick_actions_card.dart';

class DashboardQuickActionsCard extends StatelessWidget {
  final QuickActionsCard quickActionsCard;
  final bool? isReservationCard;
  const DashboardQuickActionsCard({
    super.key,
    required this.quickActionsCard,
    this.isReservationCard,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: isReservationCard != null ? Colors.black : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
            side: BorderSide(width: 1, color: Colors.grey),
          ),
        ),
        child: Column(
          children: [
            Icon(
              quickActionsCard.icon,
              color: isReservationCard != null ? Colors.white : Colors.black,
            ),
            SizedBox(height: 8),
            Text(
              quickActionsCard.name,
              style: TextStyle(
                color: isReservationCard != null ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}