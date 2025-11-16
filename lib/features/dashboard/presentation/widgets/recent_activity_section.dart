import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/dashboard/data/models/recent_activity.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/recent_activity_item.dart';

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});
  static final List<RecentActivity> recentActivities = [
    RecentActivity(
      title: "John Smith",
      roomNo: 205,
      icon: Icons.login, // check-in icon
      enumStatus: RoomStatus.checkin,
      time: "10:32 AM",
    ),
    RecentActivity(
      title: "Emily Johnson",
      roomNo: 118,
      icon: Icons.logout, // check-out icon
      enumStatus: RoomStatus.checkout,
      time: "08:15 AM",
    ),
    RecentActivity(
      title: "Michael Brown",
      roomNo: 320,
      icon: Icons.bookmark, // reservation icon
      enumStatus: RoomStatus.reservation,
      time: "Yesterday",
    ),
    RecentActivity(
      title: "Maintenance Team",
      roomNo: 412,
      icon: Icons.build, // maintenance icon
      enumStatus: RoomStatus.maintenance,
      time: "05:50 PM",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recent Activity",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            "Latest hotel operations and events",
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
          const SizedBox(height: 16),
          Column(
            children: List.generate(4, (index) {
              return RecentActivityItem(
                recentActivity: recentActivities[index],
              );
            }),
          ),
        ],
      ),
    );
  }
}
