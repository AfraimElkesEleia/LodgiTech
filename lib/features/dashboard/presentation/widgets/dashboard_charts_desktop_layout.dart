import 'package:flutter/material.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/occupancy_and_revenue_charts_section.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/room_type_distribution_chart_section.dart';

class DashboardChartsDesktopLayout extends StatelessWidget {
  const DashboardChartsDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: OccupancyAndRevenueChartsSection()),
          SizedBox(height: 10),
          Expanded(
            child: RoomTypeDistributionChartSection(),
          ),
        ],
      ),
    );
  }
}