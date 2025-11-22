import 'package:flutter/material.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
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
          Expanded(child: Container()),
          Text(
            dashboardStatus.value,
            style: AppStyles.semiBold18Black(context).copyWith(fontSize: 20),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: dashboardStatus.specialPart,
                  style: AppStyles.light12Black(context).copyWith(
                    color: dashboardStatus.isActiveGuest
                        ? Colors.blue
                        : Colors.green,
                  ),
                ),
                TextSpan(
                  text: dashboardStatus.description,
                  style: AppStyles.light12Black(
                    context,
                  ).copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
