import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RoomTypeDistributionChart extends StatefulWidget {
  const RoomTypeDistributionChart({super.key});

  @override
  State<RoomTypeDistributionChart> createState() =>
      _RoomTypeDistributionChartState();
}

class _RoomTypeDistributionChartState extends State<RoomTypeDistributionChart> {
  int touchedIndex = -1;
  List<PieChartSectionData> getPieChartSectionDataList() {
    return List.generate(4, (index) {
      bool isTouched = touchedIndex == index;
      double radius = isTouched ? 110 : 100;

      switch (index) {
        case 0:
          return PieChartSectionData(
            value: 45,
            color: Colors.deepPurpleAccent,
            radius: radius,
            showTitle: false,
            badgeWidget: Text(
              "Standard 45%",
              style: TextStyle(fontSize: 14, color: Colors.deepPurpleAccent),
            ),
            badgePositionPercentageOffset: 1.4,
          );

        case 1:
          return PieChartSectionData(
            value: 30,
            color: Colors.deepOrangeAccent,
            radius: radius,
            showTitle: false,
            badgeWidget: Text(
              "Deluxe 30%",
              style: TextStyle(fontSize: 14, color: Colors.deepOrangeAccent),
            ),
            badgePositionPercentageOffset: 1.4,
          );

        case 2:
          return PieChartSectionData(
            value: 20,
            color: Colors.yellowAccent,
            radius: radius,
            showTitle: false,
            badgeWidget: Text(
              "Suite 20%",
              style: TextStyle(fontSize: 14, color: Colors.yellow[900]),
            ),
            badgePositionPercentageOffset: 1.4,
          );

        case 3:
          return PieChartSectionData(
            value: 5,
            color: Colors.blueAccent,
            radius: radius,
            showTitle: false,
            badgeWidget: Text(
              "Premium 5%",
              style: TextStyle(fontSize: 14, color: Colors.blueAccent),
            ),
            badgePositionPercentageOffset: 1.6,
          );

        default:
          return PieChartSectionData(value: 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: AspectRatio(
        aspectRatio: 2 / 1.2,
        child: PieChart(
          PieChartData(
            sections: getPieChartSectionDataList(),
            sectionsSpace: 1,
            centerSpaceRadius: 0,
            pieTouchData: PieTouchData(
              enabled: true,
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
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
    );
  }
}
