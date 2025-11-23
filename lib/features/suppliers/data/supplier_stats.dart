import 'package:flutter/widgets.dart';

class SupplierStats {
  final String title;
  final String value;
  final String subtitle;
  final Icon icon;
  const SupplierStats({
    required this.subtitle,
    required this.title,
    required this.value,
    required this.icon
  });
}
