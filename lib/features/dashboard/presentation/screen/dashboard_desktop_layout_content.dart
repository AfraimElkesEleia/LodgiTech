import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/core/widgets/header_of_screen.dart';
import 'package:lodgitech/features/dashboard/data/models/dashboard_status.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/dashboard_charts_desktop_layout.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/desktop_layout_dashboard_status_list.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/quick_activities_and_recent_activity.dart';

class DashboardDesktopLayoutContent extends StatelessWidget {
  const DashboardDesktopLayoutContent({super.key});

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
      name: "Active Guests", // Fixed typo: "Activ" to "Active"
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
          SliverToBoxAdapter(
            child: HeaderOfScreen(titleOfScreen: "Dashboard",),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: DashBoardStatusItemsList(
              dashboardStatusItems: dashboardStatusItems,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const SliverToBoxAdapter(child: DashboardChartsDesktopLayout()),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          SliverToBoxAdapter(child: QuickActivitiesAndRecentActivity()),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
