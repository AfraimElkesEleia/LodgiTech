import 'package:flutter/material.dart';

class RoomStats {
  final int number;
  final Color color;
  final Stats state;
  final String name;

  RoomStats({required this.number, required this.state})
    : color = _mapColor(state),
      name = _mapName(state);

  static Color _mapColor(Stats state) {
    switch (state) {
      case Stats.available:
        return Colors.green;
      case Stats.occupied:
        return Colors.blue;
      case Stats.maintenance:
        return Colors.red;
      case Stats.cleaning:
        return Colors.orange;
      case Stats.total:
        return Colors.black;
    }
  }

  static String _mapName(Stats state) {
    switch (state) {
      case Stats.available:
        return "Available";
      case Stats.occupied:
        return "Occupied";
      case Stats.maintenance:
        return "Maintenance";
      case Stats.cleaning:
        return "Cleaning";
      case Stats.total:
        return "Total Rooms";
    }
  }
}

enum Stats { available, occupied, maintenance, cleaning, total }
