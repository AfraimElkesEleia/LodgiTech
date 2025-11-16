import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/dashboard/data/models/quick_actions_card.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/quick_action_card.dart';

class QuickActivitySection extends StatelessWidget {
  const QuickActivitySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick Actions",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          SizedBox(height: 6),
          Text(
            "Common hotel management tasks",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Row(
                children: [
                  DashboardQuickActionsCard(
                    quickActionsCard: QuickActionsCard(
                      name: "New Reservation",
                      icon: FontAwesomeIcons.calendar,
                    ),
                    isReservationCard: true,
                  ),
                  DashboardQuickActionsCard(
                    quickActionsCard: QuickActionsCard(
                      name: "Quick check in",
                      icon: FontAwesomeIcons.user,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  DashboardQuickActionsCard(
                    quickActionsCard: QuickActionsCard(
                      name: "Room Status",
                      icon: FontAwesomeIcons.building,
                    ),
                  ),
                  DashboardQuickActionsCard(
                    quickActionsCard: QuickActionsCard(
                      name: "Generate Bill",
                      icon: FontAwesomeIcons.moneyBill,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}