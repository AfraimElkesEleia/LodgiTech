import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lodgitech/features/suppliers/data/order_volume.dart';

class OrderVolumeChart extends StatelessWidget {
  const OrderVolumeChart({super.key});

  static final List<OrderVolume> orders = [
    OrderVolume(month: "Apr", freq: 60),
    OrderVolume(month: "May", freq: 48),
    OrderVolume(month: "Jun", freq: 52),
    OrderVolume(month: "Jul", freq: 58),
    OrderVolume(month: "Aug", freq: 50),
    OrderVolume(month: "Sep", freq: 55),
  ];

  @override
  Widget build(BuildContext context) {
    // Find max freq to set chart maxY dynamically
    final maxY =
        orders.map((e) => e.freq).reduce((a, b) => a > b ? a : b).toDouble() +
        10;

    return BarChart(
      BarChartData(
        maxY: maxY,
        barGroups: List.generate(orders.length, (index) {
          final order = orders[index];
          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: order.freq.toDouble(),
                color: Colors.blue,
                width: 20,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          );
        }),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                if (value.toInt() >= 0 && value.toInt() < orders.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      orders[value.toInt()].month,
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
              interval: 10,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                );
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
        gridData: FlGridData(
          show: true,
          horizontalInterval: 10,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(color: Colors.grey.withOpacity(0.3), strokeWidth: 1);
          },
        ),
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
