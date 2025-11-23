import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class OccupancyChartWidget extends StatelessWidget {
  const OccupancyChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  final dates = [
                    '2024-10-01',
                    '2024-10-02',
                    '2024-10-03',
                    '2024-10-04',
                    '2024-10-05',
                    '2024-10-06',
                    '2024-10-07',
                  ];
                  if (value % 1 != 0) {
                    return const SizedBox.shrink();
                  }
                  if (value >= 0 && value < dates.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Transform.rotate(
                        angle: 25 * 3.1415926535 / 180,
                        child: Text(
                          dates[value.toInt()],
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
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
                  final values = [100, 75, 50, 25, 0];
                  if (values.contains(value.toInt())) {
                    return Text(
                      value.toInt().toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
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
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 100,
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 85),
                FlSpot(1, 75),
                FlSpot(2, 92),
                FlSpot(3, 88),
                FlSpot(4, 98),
                FlSpot(5, 89),
                FlSpot(6, 91),
              ],
              isCurved: true,
              curveSmoothness: 0.2,
              color: Colors.blue,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.withOpacity(0.3),
                    Colors.blue.withOpacity(0.1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
