
import 'package:flutter/material.dart';
import 'package:lodgitech/features/dashboard/data/models/dashboard_status.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/basic_information_block.dart';

class DashBoardStatusItemsList extends StatelessWidget {
  const DashBoardStatusItemsList({
    super.key,
    required this.dashboardStatusItems,
  });

  final List<DashboardStatus> dashboardStatusItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: dashboardStatusItems.map((status) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: BasicInformationBlockItem(dashboardStatus: status),
          ),
        );
      }).toList(),
    );
  }
}
