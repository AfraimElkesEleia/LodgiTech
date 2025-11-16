import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class OccupancyRevenueBarChart extends StatelessWidget {
  final List<String> months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"];

  // Occupancy (%) values
  final List<double> occupancy = [85, 78, 92, 88, 97, 90];

  // Revenue values
  final List<double> revenue = [120000, 95000, 140000, 125000, 150000, 135000];

  // Max revenue for scaling
  final double maxRevenue = 160000;

  OccupancyRevenueBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 2 / 1.2,
        child: BarChart(
          BarChartData(
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              horizontalInterval: 25,
              getDrawingHorizontalLine: (value) =>
                  FlLine(color: Colors.grey.withOpacity(0.3), strokeWidth: 1),
            ),
            barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: BarTouchTooltipData(
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  String month = months[group.x.toInt()];

                  // If rodIndex == 0 → occupancy
                  if (rodIndex == 0) {
                    return BarTooltipItem(
                      "$month\nOccupancy: ${occupancy[groupIndex]}%",
                      const TextStyle(color: Colors.white),
                    );
                  }

                  // If rodIndex == 1 → revenue
                  double realRevenue = revenue[groupIndex];

                  return BarTooltipItem(
                    "$month\nRevenue: \$${realRevenue.toStringAsFixed(0)}",
                    const TextStyle(color: Colors.white),
                  );
                },
              ),
            ),
            borderData: FlBorderData(show: false),

            // -------------------------------
            // BOTTOM TITLES (Months)
            // -------------------------------
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    int index = value.toInt();
                    if (index < 0 || index >= months.length) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(months[index]),
                    );
                  },
                ),
              ),

              // LEFT TITLES (Occupancy %)
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  interval: 25,
                  getTitlesWidget: (value, meta) {
                    return Text("${value.toInt()}%");
                  },
                ),
              ),

              // RIGHT TITLES (Revenue)
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 60,
                  getTitlesWidget: (value, meta) {
                    // Convert scaled Y back to revenue
                    double original = (value / 100) * maxRevenue;

                    if (original % 2 == 0) {
                      return Text(original.toInt().toString());
                    }
                    return const SizedBox();
                  },
                ),
              ),

              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),

            // -------------------------------
            // MAX & MIN Y (0–100)
            // -------------------------------
            maxY: 100,
            minY: 0,

            // -------------------------------
            // BAR GROUPS
            // -------------------------------
            barGroups: List.generate(months.length, (index) {
              return BarChartGroupData(
                x: index,
                barsSpace: 12,
                barRods: [
                  // Occupancy bar (purple)
                  BarChartRodData(
                    toY: occupancy[index],
                    width: 12,
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(4),
                  ),

                  // Revenue bar (green), scaled from 0–100
                  BarChartRodData(
                    toY: (revenue[index] / maxRevenue) * 100,
                    width: 12,
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
