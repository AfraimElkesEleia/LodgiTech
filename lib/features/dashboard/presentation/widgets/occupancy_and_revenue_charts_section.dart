import 'package:flutter/material.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/revenue_occupancy_chart.dart';

class OccupancyAndRevenueChartsSection extends StatelessWidget {
  final CrossAxisAlignment? crossAxisAlignment;

  const OccupancyAndRevenueChartsSection({super.key, this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: [
          Text(
            "Occupancy & Revenue Trends",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          SizedBox(height: 6),
          Text(
            "Monthly occupancy rate and revenue over time",
            style: AppStyles.normal16Grey(context).copyWith(fontSize: 14),
          ),
          SizedBox(height: 20),
          OccupancyRevenueBarChart(),
        ],
      ),
    );
  }
}
