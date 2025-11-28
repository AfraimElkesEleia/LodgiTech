import 'package:flutter/material.dart';
import 'package:lodgitech/features/reports/data/models/report_analysis.dart';
import 'package:lodgitech/features/reports/presentation/widgets/report_data_block.dart';

class ReportDataBlockGridView extends StatelessWidget {
  final double aspectRatio;
  final int crossAxisCount;
  const ReportDataBlockGridView({
    super.key,
    required this.reportSummaryItems,
    this.aspectRatio = 2,
    this.crossAxisCount = 2,
  });

  final List<ReportAnalysisSummary> reportSummaryItems;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: aspectRatio,
      ),
      itemCount: 4,
      itemBuilder: (context, index) =>
          ReportDataBlock(reportSummaryItems: reportSummaryItems[index]),
    );
  }
}
