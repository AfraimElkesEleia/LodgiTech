import 'package:flutter/material.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/quick_activity_section.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/recent_activity_section.dart';

class QuickActivitiesAndRecentActivity extends StatelessWidget {
  const QuickActivitiesAndRecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(child: RecentActivitySection()),
          Expanded(child: QuickActivitySection()),
        ],
      ),
    );
  }
}
