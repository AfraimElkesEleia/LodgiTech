import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/header_of_screen.dart';
import 'package:lodgitech/features/reports/data/models/report_analysis.dart';
import 'package:lodgitech/features/reports/presentation/widgets/customer_segmentation_section.dart';
import 'package:lodgitech/features/reports/presentation/widgets/report_chart_section.dart';
import 'package:lodgitech/features/reports/presentation/widgets/report_data_block.dart';
import 'package:lodgitech/features/reports/presentation/widgets/report_data_block_grid_view.dart';
import 'package:lodgitech/features/reports/presentation/widgets/report_summary_section.dart';
import 'package:lodgitech/features/reports/presentation/widgets/room_type_performance_section.dart';

class ReportsTabletLayout extends StatelessWidget {
  ReportsTabletLayout({super.key});
  static final List<ReportAnalysisSummary> reportSummaryItems = [
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
          SliverToBoxAdapter(child: HeaderOfScreen(titleOfScreen: "Reports")),
          ReportDataBlockGridView(reportSummaryItems: reportSummaryItems),
          ReportChartSection(aspectRatio: 2.3 / 1.5),
          SliverToBoxAdapter(
            child: Expanded(child: RoomTypePerformanceSection()),
          ),
          SliverToBoxAdapter(
            child: Expanded(child: CustomerSegmentationSection()),
          ),
          SliverToBoxAdapter(child: Expanded(child: ReportSummarySection())),
        ],
      ),
    );
  }
}
