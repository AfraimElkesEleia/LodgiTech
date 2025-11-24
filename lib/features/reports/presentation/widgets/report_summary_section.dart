
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/features/reports/presentation/widgets/report_summary_block.dart';

class ReportSummarySection extends StatelessWidget {
  const ReportSummarySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ReportSummaryBlock(
            title: "Daily Reports",
            icon: FontAwesomeIcons.newspaper,
          ),
        ),
        Expanded(
          child: ReportSummaryBlock(
            title: "Weekly Summary",
            icon: FontAwesomeIcons.calendar,
          ),
        ),
        Expanded(
          child: ReportSummaryBlock(
            title: "Monthly Revenue",
            icon: FontAwesomeIcons.moneyBill,
          ),
        ),
        Expanded(
          child: ReportSummaryBlock(
            title: "Annual Reports",
            icon: FontAwesomeIcons.arrowTrendUp,
          ),
        ),
      ],
    );
  }
}

