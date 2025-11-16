import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/revenue_occupancy_chart.dart';

class OccupancyAndRevenueChartsSection extends StatelessWidget {
  const OccupancyAndRevenueChartsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Occupancy & Revenue Trends",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          SizedBox(height: 6),
          Text(
            "Monthly occupancy rate and revenue over time",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 20),
          OccupancyRevenueBarChart(),
        ],
      ),
    );
  }
}
