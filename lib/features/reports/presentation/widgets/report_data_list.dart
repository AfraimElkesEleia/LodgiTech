
import 'package:flutter/material.dart';
import 'package:lodgitech/features/reports/data/models/report_analysis.dart';
import 'package:lodgitech/features/reports/presentation/widgets/report_data_block.dart';

class ReportDataList extends StatelessWidget {
  const ReportDataList({
    super.key,
    required this.reportSummaryItems,
  });

  final List<ReportAnalysisSummary> reportSummaryItems;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 6 / 1,
        child: Row(
          children: List.generate(4, (index) {
            return Expanded(
              child: ReportDataBlock(
                reportSummaryItems: reportSummaryItems[index],
              ),
            );
          }),
        ),
      ),
    );
  }
}
