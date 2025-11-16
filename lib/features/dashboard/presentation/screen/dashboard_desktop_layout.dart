import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/dashboard/data/models/dashboard_status.dart';
import 'package:lodgitech/features/dashboard/data/models/quick_actions_card.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/basic_information_block.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/custom_drawer.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/dashboard_charts_desktop_layout.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/recent_activity_section.dart';

class DashboardDesktopLayout extends StatelessWidget {
  const DashboardDesktopLayout({super.key});

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
      body: Row(
        children: [
          const Expanded(flex: 1, child: CustomDrawer()),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Dashboard",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(text: "Welcome back, "),
                              TextSpan(
                                text: "Hotel Administrator",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child: DashBoardStatusItemsList(
                    dashboardStatusItems: dashboardStatusItems,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                const SliverToBoxAdapter(child: DashboardChartsDesktopLayout()),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(child: RecentActivitySection()),
                        Expanded(
                          child: CustomContainer(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Occupancy & Revenue Trends",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "Monthly occupancy rate and revenue over time",
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardQuickActionsCard extends StatelessWidget {
  final QuickActionsCard quickActionsCard;
  final bool? isReservationCard;
  const DashboardQuickActionsCard({
    super.key,
    required this.quickActionsCard,
    this.isReservationCard,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: isReservationCard != null ? Colors.black : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
            side: BorderSide(width: 1, color: Colors.grey),
          ),
        ),
        child: Column(
          children: [
            Icon(
              quickActionsCard.icon,
              color: isReservationCard != null ? Colors.white : Colors.black,
            ),
            SizedBox(height: 8),
            Text(
              quickActionsCard.name,
              style: TextStyle(
                color: isReservationCard != null ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
