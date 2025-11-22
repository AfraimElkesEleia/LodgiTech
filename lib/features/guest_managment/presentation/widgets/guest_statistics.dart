
import 'package:flutter/material.dart';

class GuestStatistics extends StatelessWidget {
  const GuestStatistics({super.key, required this.number, required this.title});

  final String number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
          color: Color(0xFFECECF0),
        ),
        child: Column(
          children: [
            Text(
              number,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(title, style: TextStyle(color: Color(0xFF717182))),
          ],
        ),
      ),
    );
  }
}
