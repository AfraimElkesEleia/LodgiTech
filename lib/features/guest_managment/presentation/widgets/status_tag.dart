import 'package:flutter/material.dart';

class StatusTag extends StatelessWidget {
  final String status;

  const StatusTag({super.key, required this.status});

  Color _getColor(String status) {
    switch (status.toLowerCase()) {
      case "checked in":
        return Colors.green;
      case "checked out":
        return Colors.grey;
      case "reserved":
        return Colors.orange;
      default:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
