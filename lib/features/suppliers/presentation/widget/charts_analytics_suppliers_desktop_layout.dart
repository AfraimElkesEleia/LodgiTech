import 'package:flutter/material.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/monthly_spend_trend_section.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/order_volume_section.dart';

class ChartsAnalyticsSuppliersDesktopLayout extends StatelessWidget {
  const ChartsAnalyticsSuppliersDesktopLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: MonthlySpendTrendSection(),
          ),
          Expanded(
            child: OrderVolumeSection(),
          ),
        ],
      ),
    );
  }
}
