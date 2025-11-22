import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/core/widgets/header_of_screen.dart';
import 'package:lodgitech/features/dashboard/data/models/dashboard_status.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/basic_information_block.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/occupancy_and_revenue_charts_section.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/quick_activity_section.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/recent_activity_section.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/room_type_distribution_chart_section.dart';

class DashboardTabletLayoutContent extends StatelessWidget {
  const DashboardTabletLayoutContent({super.key});
  static const List<DashboardStatus> dashboardStatusItems = [
    DashboardStatus(
      icon: FontAwesomeIcons.building,
      name: "Total Rooms",
      value: "150",
      specialPart: "134 Occupied",
      description: "16 Available",
      isActiveGuest: false,
    ),
    DashboardStatus(
      icon: FontAwesomeIcons.arrowTrendUp,
      name: "Occupancy Rate",
      value: "89.3%",
      specialPart: "+2.1% ",
      description: "from last month",
      isActiveGuest: false,
    ),
    DashboardStatus(
      icon: FontAwesomeIcons.moneyBill,
      name: "Monthly Revenue",
      value: "\$123,450",
      specialPart: "+8.2%",
      description: " from last month",
      isActiveGuest: false,
    ),
    DashboardStatus(
      icon: FontAwesomeIcons.user,
      name: "Active Guests",
      value: "287",
      specialPart: "23 Check-ins ",
      description: "today",
      isActiveGuest: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: HeaderOfScreen(titleOfScreen: "Dashboard")),
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 1,
            ),
            itemCount: dashboardStatusItems.length,
            itemBuilder: (context, index) {
              return BasicInformationBlockItem(
                dashboardStatus: dashboardStatusItems[index],
              );
            },
          ),
          SliverToBoxAdapter(
            child: AspectRatio(
              aspectRatio: 2 / 1.2,
              child: OccupancyAndRevenueChartsSection(
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: AspectRatio(
              aspectRatio: 1.8 / 1.2,
              child: RoomTypeDistributionChartSection(
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
          ),
          SliverToBoxAdapter(child: RecentActivitySection()),
          SliverToBoxAdapter(child: QuickActivitySection()),
        ],
      ),
    );
  }
}
