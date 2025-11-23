
import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/reports/data/models/report_analysis.dart';

class ReportDataBlock extends StatelessWidget {
  const ReportDataBlock({
    super.key,
    required this.reportSummaryItems,
  });

  final ReportAnalysisSummary reportSummaryItems;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                reportSummaryItems.title,
                style: AppStyles.semiBold14Black(
                  context,
                ).copyWith(fontSize: 12),
              ),
              Icon(reportSummaryItems.icon),
            ],
          ),
          Expanded(child: Container()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reportSummaryItems.value,
                style: AppStyles.semiBold14Black(context),
              ),
              Row(
                children: [
                  Text(
                    reportSummaryItems.descriptionValue,
                    style: AppStyles.light12Black(
                      context,
                    ).copyWith(color: Colors.red),
                  ),
                  horizontalSpace(8),
                  Expanded(
                    child: Text(
                      reportSummaryItems.description,
                      style: AppStyles.light12Black(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
