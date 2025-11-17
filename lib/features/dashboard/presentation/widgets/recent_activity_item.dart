import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/dashboard/data/models/recent_activity.dart';

class RecentActivityItem extends StatelessWidget {
  final RecentActivity recentActivity;
  const RecentActivityItem({super.key, required this.recentActivity});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        isThreeLine: true,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: recentActivity.iconBackground,
            shape: BoxShape.circle,
          ),
          child: Icon(
            FontAwesomeIcons.calendar,
            color: recentActivity.iconColor,
            size: 20,
          ),
        ),
        title: Text(
          recentActivity.title,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text("Room ${recentActivity.roomNo}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: BoxDecoration(
                color: recentActivity.statusForeground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  recentActivity.status,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Icon(FontAwesomeIcons.clock, color: Colors.grey, size: 16),
            SizedBox(width: 8),
            Text(
              recentActivity.time,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
