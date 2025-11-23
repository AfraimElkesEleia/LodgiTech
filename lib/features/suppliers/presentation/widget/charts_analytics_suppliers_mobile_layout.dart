import 'package:flutter/material.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/monthly_spend_trend_section.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/order_volume_section.dart';

class ChartsAnalyticsSuppliersMobileLayout extends StatelessWidget {
  const ChartsAnalyticsSuppliersMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MonthlySpendTrendSection(),
        SizedBox(height: 20),
        OrderVolumeSection(),
      ],
    );
  }
}