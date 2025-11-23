import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/monthly_spend_chart.dart';

class MonthlySpendTrendSection extends StatelessWidget {
  const MonthlySpendTrendSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Monthly Spend Trend",
            style: AppStyles.semiBold14Black(context),
          ),
          Text(
            "Procurement spending over time",
            style: AppStyles.extraLight14Grey(context),
          ),
          verticalSpace(12),
          AspectRatio(
            aspectRatio: 2 / 1,
            child: MonthlySpendChart(),
          ),
        ],
      ),
    );
  }
}
