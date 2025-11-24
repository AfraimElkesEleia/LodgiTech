import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RoomPerformanceChartWidget extends StatelessWidget {
  const RoomPerformanceChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        minY: 0,
        maxY: 34000,
        groupsSpace: 25,
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              final roomTypes = ['Standard', 'Deluxe', 'Suite', 'Premium'];
              final amount = rod.toY.toInt();
              return BarTooltipItem(
                '${roomTypes[group.x.toInt()]}\n\$${amount.toStringAsFixed(0)}',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
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
                final roomTypes = ['Standard', 'Deluxe', 'Suite', 'Premium'];
                if (value >= 0 && value < roomTypes.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      roomTypes[value.toInt()],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  );
                }
                return const Text('');
              },
              reservedSize: 40,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final values = [0, 8500, 17000, 25500, 34000];
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
            if (value % 8500 == 0) {
              return FlLine(color: Colors.grey[300], strokeWidth: 1);
            }
            return FlLine(color: Colors.grey[100], strokeWidth: 0.5);
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey[300]!, width: 1),
        ),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: 26700,
                width: 20,
                color: _getBarColor(26700, 34000),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: 32160,
                width: 20,
                color: _getBarColor(32160, 34000),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: 28900,
                width: 20,
                color: _getBarColor(28900, 34000),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                toY: 18000,
                width: 20,
                color: _getBarColor(18000, 34000),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getBarColor(double value, double maxValue) {
    final percentage = value / maxValue;
    if (percentage > 0.8) return Colors.green;
    if (percentage > 0.6) return Colors.blue;
    if (percentage > 0.4) return Colors.orange;
    return Colors.red;
  }
}
