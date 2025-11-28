import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/core/widgets/custom_drop_down_menu.dart';
import 'package:lodgitech/features/reports/presentation/widgets/customer_analytics_chart_widget.dart';
import 'package:lodgitech/features/reports/presentation/widgets/occupancy_chart_widget.dart';
import 'package:lodgitech/features/reports/presentation/widgets/revenue_chart_widget.dart';
import 'package:lodgitech/features/reports/presentation/widgets/room_performance_chart_widget.dart';

class ReportChartSection extends StatefulWidget {
  final double aspectRatio;

  const ReportChartSection({super.key, this.aspectRatio = 2.3 / 0.9});

  @override
  State<ReportChartSection> createState() => _ReportChartSectionState();
}

class _ReportChartSectionState extends State<ReportChartSection> {
  String selectedReport = "Occupancy Report";
  String selectedPeriod = "This Week";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 800;

    return SliverToBoxAdapter(
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
            isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StringDropDownMenu(
                        items: [
                          "Occupancy Report",
                          "Revenue Report",
                          "Customer Analytics",
                          "Room Performance",
                        ],
                        width: double.infinity,
                        onSelected: (value) {
                          setState(() {
                            selectedReport = value!;
                          });
                        },
                      ),
                      verticalSpace(8),
                      StringDropDownMenu(
                        items: [
                          "This Week",
                          "This Month",
                          "This Quarter",
                          "This Year",
                        ],
                        width: double.infinity,
                        onSelected: (value) {
                          setState(() {
                            selectedPeriod = value!;
                          });
                        },
                      ),
                    ],
                  )
                : Row(
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
              aspectRatio: widget.aspectRatio,
              child: _buildSelectedChart(),
            ),

            verticalSpace(10),
          ],
        ),
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
