import 'package:flutter/widgets.dart';

class DashboardStatus {
  final IconData icon;
  final String name;
  final String value;
  final String specialPart;
  final String description;
  final bool isActiveGuest;

  const DashboardStatus({
    required this.icon,
    required this.name,
    required this.value,
    required this.specialPart,
    required this.description,
    required this.isActiveGuest,
  });
}
