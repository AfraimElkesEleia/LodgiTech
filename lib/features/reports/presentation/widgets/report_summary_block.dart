import 'package:flutter/widgets.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';

class ReportSummaryBlock extends StatelessWidget {
  final String title;
  final IconData icon;
  const ReportSummaryBlock({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(child: Column(children: [Icon(icon), Text(title)]));
  }
}
