import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/core/widgets/custom_drop_down_menu.dart';
import 'package:lodgitech/core/widgets/header_of_screen.dart';
import 'package:lodgitech/features/reports/data/models/report_analysis.dart';
import 'package:lodgitech/features/reports/presentation/widgets/customer_analytics_chart_widget.dart';
import 'package:lodgitech/features/reports/presentation/widgets/occupancy_chart_widget.dart';
import 'package:lodgitech/features/reports/presentation/widgets/report_data_list.dart';
import 'package:lodgitech/features/reports/presentation/widgets/revenue_chart_widget.dart';
import 'package:lodgitech/features/reports/presentation/widgets/room_performance_chart_widget.dart';

class ReportsDesktopLayout extends StatefulWidget {
  const ReportsDesktopLayout({super.key});

  @override
  State<ReportsDesktopLayout> createState() => _ReportsDesktopLayoutState();
}

class _ReportsDesktopLayoutState extends State<ReportsDesktopLayout> {
  final List<ReportAnalysisSummary> reportSummaryItems = [
    ReportAnalysisSummary(
      title: "Total Revenue",
      value: "\$765,000",
      icon: Icons.attach_money,
      descriptionValue: "+12.5%",
      description: "from last period",
    ),
    ReportAnalysisSummary(
      title: "Avg Occupancy",
      value: "88.3%",
      icon: Icons.house,
      descriptionValue: "+3.2%",
      description: "from last period",
    ),
    ReportAnalysisSummary(
      title: "Total Guests",
      value: "348",
      icon: Icons.group,
      descriptionValue: "+8.7%",
      description: "from last period",
    ),
    ReportAnalysisSummary(
      title: "Total Bookings",
      value: "202",
      icon: Icons.book_online,
      descriptionValue: "-2.1%",
      description: "from last period",
    ),
  ];
  String selectedReport = "Occupancy Report";
  String selectedPeriod = "This Week";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: HeaderOfScreen(titleOfScreen: "Report")),
          ReportDataList(reportSummaryItems: reportSummaryItems),
          SliverToBoxAdapter(child: verticalSpace(10)),
          SliverToBoxAdapter(
            child: CustomContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hotel Analytics Reports",
                    style: AppStyles.semiBold14Black(context),
                  ),
                  Text(
                    "Comprehensive insights into hotel operations and performance",
                    style: AppStyles.extraLight14Grey(context),
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      StringDropDownMenu(
                        items: [
                          "Occupancy Report",
                          "Revenue Report",
                          "Customer Analytics",
                          "Room Performance",
                        ],
                        width: 250,
                        onSelected: (value) {
                          setState(() {
                            selectedReport = value!;
                          });
                        },
                      ),
                      horizontalSpace(8),
                      StringDropDownMenu(
                        items: [
                          "This Week",
                          "This Month",
                          "This Quarter",
                          "This Year",
                        ],
                        width: 200,
                        onSelected: (value) {
                          setState(() {
                            selectedPeriod = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  AspectRatio(
                    aspectRatio: 2 / 0.8,
                    child: _buildSelectedChart(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedChart() {
    switch (selectedReport) {
      case "Occupancy Report":
        return OccupancyChartWidget();

      case "Revenue Report":
        return RevenueChartWidget();

      case "Customer Analytics":
        return CustomerAnalyticsChartWidget();

      case "Room Performance":
        return RoomPerformanceChartWidget();

      default:
        return SizedBox();
    }
  }
}
