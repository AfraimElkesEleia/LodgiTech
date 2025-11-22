import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/core/herlper/spacing.dart';

class CurrentStayInformation extends StatelessWidget {
  final String roomNo;
  final DateTime checkIn;
  final DateTime checkOut;

  const CurrentStayInformation({
    super.key,
    required this.roomNo,
    required this.checkIn,
    required this.checkOut,
  });

  String formatDate(DateTime date) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(date.day)}/${twoDigits(date.month)}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Current Stay Information",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          verticalSpace(16),

          Row(
            children: [
              _tableItem("Room No", roomNo),
              _divider(),
              _tableItem("Check-in", formatDate(checkIn)),
              _divider(),
              _tableItem("Check-out", formatDate(checkOut)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tableItem(String title, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              )),
          verticalSpace(4),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: 1,
      height: 40,
      color: Colors.grey.withOpacity(0.3),
      margin: const EdgeInsets.symmetric(horizontal: 12),
    );
  }
}
