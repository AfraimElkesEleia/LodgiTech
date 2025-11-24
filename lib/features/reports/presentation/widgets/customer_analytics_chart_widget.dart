import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CustomerAnalyticsChartWidget extends StatefulWidget {
  const CustomerAnalyticsChartWidget({super.key});

  @override
  State<CustomerAnalyticsChartWidget> createState() =>
      _CustomerAnalyticsChartWidgetState();
}

class _CustomerAnalyticsChartWidgetState
    extends State<CustomerAnalyticsChartWidget> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 250,
            child: PieChart(
              PieChartData(
                sections: _createSections(),
                centerSpaceRadius: 40,
                sectionsSpace: 2,
                startDegreeOffset: -90,
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = null;
                        return;
                      }
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(child: _buildLegend()),
        ],
      ),
    );
  }

  List<PieChartSectionData> _createSections() {
    final data = [
      {'label': 'Business', 'value': 42, 'color': Colors.blue},
      {'label': 'Leisure', 'value': 28, 'color': Colors.green},
      {'label': 'Group', 'value': 19, 'color': Colors.orange},
      {'label': 'VIP', 'value': 11, 'color': Colors.purple},
    ];

    return List.generate(data.length, (index) {
      final isTouched = index == touchedIndex;
      final radius = isTouched ? 70.0 : 60.0;

      return PieChartSectionData(
        color: data[index]['color'] as Color,
        value: data[index]['value'] as double,
        title: '${data[index]['value']}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: isTouched ? 16 : 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    });
  }

  Widget _buildLegend() {
    final data = [
      {'label': 'Business', 'value': 42, 'color': Colors.blue},
      {'label': 'Leisure', 'value': 28, 'color': Colors.green},
      {'label': 'Group', 'value': 19, 'color': Colors.orange},
      {'label': 'VIP', 'value': 11, 'color': Colors.purple},
    ];

    bool isValidIndex(int? index) {
      return index != null && index >= 0 && index < data.length;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(data.length, (index) {
        final isTouched = isValidIndex(touchedIndex)
            ? index == touchedIndex
            : false;
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              Container(
                width: isTouched ? 20 : 16,
                height: isTouched ? 20 : 16,
                decoration: BoxDecoration(
                  color: data[index]['color'] as Color,
                  shape: BoxShape.circle,
                  border: isTouched
                      ? Border.all(color: Colors.black, width: 2)
                      : null,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  '${data[index]['label']} (${data[index]['value']}%)',
                  style: TextStyle(
                    fontSize: isTouched ? 16 : 14,
                    fontWeight: isTouched ? FontWeight.bold : FontWeight.w500,
                    color: isTouched ? Colors.blue : Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
