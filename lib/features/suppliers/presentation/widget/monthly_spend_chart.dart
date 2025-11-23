import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lodgitech/features/suppliers/data/monthly_spend.dart';

class MonthlySpendChart extends StatelessWidget {
  const MonthlySpendChart({super.key});

  static final List<MonthlySpend> monthlyData = [
    MonthlySpend(month: 'April', sales: 18000.0),
    MonthlySpend(month: 'May', sales: 24000.0),
    MonthlySpend(month: 'June', sales: 12000.0),
    MonthlySpend(month: 'July', sales: 6000.0),
    MonthlySpend(month: 'August', sales: 12000.0),
    MonthlySpend(month: 'September', sales: 18000.0),
  ];

  @override
  Widget build(BuildContext context) {
    print('Chart data:');
    for (int i = 0; i < monthlyData.length; i++) {
      print('${monthlyData[i].month}: ${monthlyData[i].sales}');
    }

    return LineChart(
      LineChartData(
        minY: 0,
        maxY: 24000,
        lineBarsData: [
          LineChartBarData(
            spots: List.generate(monthlyData.length, (index) {
              final sales = monthlyData[index].sales;
              print('Spot $index: FlSpot($index.toDouble(), $sales)');
              return FlSpot(index.toDouble(), sales);
            }),
            isCurved: true,
            color: Colors.blue,
            barWidth: 3,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: Colors.white,
                  strokeWidth: 2,
                  strokeColor: Colors.blue,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue.withOpacity(0.3),
                  Colors.blue.withOpacity(0.1),
                ],
              ),
            ),
          ),
        ],
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 6000,
          getDrawingHorizontalLine: (value) {
            return FlLine(color: Colors.grey.withOpacity(0.3), strokeWidth: 1);
          },
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final months = ['Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'];
                if (value.toInt() >= 0 && value.toInt() < months.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      months[value.toInt()],
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  );
                } else {
                  return const Text('');
                }
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 6000,
              getTitlesWidget: (value, meta) {
                if (value % 6000 == 0) {
                  return Text(
                    '${value.toInt()}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  );
                }
                return const Text('');
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
