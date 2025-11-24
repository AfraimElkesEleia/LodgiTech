import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class RevenueChartWidget extends StatelessWidget {
  const RevenueChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildChart()],
      ),
    );
  }

  Widget _buildChart() {
    return SizedBox(
      height: 300,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 160000,
          minY: 0,
          groupsSpace: 20,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final month = [
                  'Jan',
                  'Feb',
                  'Mar',
                  'Apr',
                  'May',
                  'Jun',
                ][group.x.toInt()];
                final revenueType = rodIndex == 0 ? 'Room' : 'Service';
                final amount = rod.toY.toInt();
                return BarTooltipItem(
                  '$month - $revenueType\n\$${amount.toStringAsFixed(0)}',
                  const TextStyle(color: Colors.white),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                  if (value >= 0 && value < months.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        months[value.toInt()],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }
                  return const Text('');
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final values = [0, 40000, 80000, 120000, 160000];
                  if (values.contains(value.toInt())) {
                    return Text(
                      '\$${(value / 1000).toStringAsFixed(0)}K',
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    );
                  }
                  return const Text('');
                },
                reservedSize: 40,
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(color: Colors.grey[300], strokeWidth: 1);
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey[300]!, width: 1),
          ),
          barGroups: _createBarGroups(),
        ),
      ),
    );
  }

  List<BarChartGroupData> _createBarGroups() {
    final roomRevenue = [
      118000,
      102000,
      130000,
      122000,
      138000,
      135000,
    ]; // Only Jan data available
    final serviceRevenue = [
      2000,
      300,
      5000,
      6000,
      7000,
      7000,
    ]; // Only Jan data available

    return List.generate(6, (index) {
      return BarChartGroupData(
        x: index,
        groupVertically: false,
        barRods: [
          BarChartRodData(
            toY: roomRevenue[index].toDouble(),
            color: Colors.blue,
            width: 12,
            borderRadius: BorderRadius.circular(4),
          ),
          BarChartRodData(
            toY: serviceRevenue[index].toDouble(),
            color: Colors.green,
            width: 12,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    });
  }
}
