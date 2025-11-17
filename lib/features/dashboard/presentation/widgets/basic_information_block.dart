
import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/dashboard/data/models/dashboard_status.dart';

class BasicInformationBlockItem extends StatelessWidget {
  final DashboardStatus dashboardStatus;
  const BasicInformationBlockItem({super.key, required this.dashboardStatus});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(dashboardStatus.name), Icon(dashboardStatus.icon)],
          ),
          SizedBox(height: 32),
          Text(
            dashboardStatus.value,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 30),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: dashboardStatus.specialPart,
                  style: TextStyle(
                    color: dashboardStatus.isActiveGuest
                        ? Colors.blue
                        : Colors.green,
                  ),
                ),
                TextSpan(
                  text: dashboardStatus.description,
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}