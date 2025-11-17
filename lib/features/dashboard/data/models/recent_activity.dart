import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class RecentActivity {
  final String title;
  final int roomNo;
  final IconData icon;

  final Color? iconColor; // main color (same as before)
  final Color iconBackground; // new background = color[50]
  final Color statusColor; // background for status chip
  final Color statusForeground; // text color for status
  final String status;
  final RoomStatus enumStatus;
  final String time;

  RecentActivity({
    required this.title,
    required this.roomNo,
    required this.icon,
    required this.enumStatus,
    required this.time,
  }) : iconColor = _getIconColor(enumStatus),
       iconBackground = _getIconBackground(enumStatus),
       statusColor = _getStatusColor(enumStatus),
       statusForeground = _getStatusForeground(enumStatus),
       status = _getStatusText(enumStatus);
}

Color? _getIconColor(RoomStatus status) {
  switch (status) {
    case RoomStatus.checkin:
      return Colors.green[700];
    case RoomStatus.checkout:
      return Colors.red[700];
    case RoomStatus.reservation:
      return Colors.blue[700];
    case RoomStatus.maintenance:
      return Colors.orange[700];
  }
}

Color _getStatusColor(RoomStatus status) {
  switch (status) {
    case RoomStatus.checkin:
      return Colors.green.shade100;
    case RoomStatus.checkout:
      return Colors.red.shade100;
    case RoomStatus.reservation:
      return Colors.blue.shade100;
    case RoomStatus.maintenance:
      return Colors.orange.shade100;
  }
}

String _getStatusText(RoomStatus status) {
  switch (status) {
    case RoomStatus.checkin:
      return "Check In";
    case RoomStatus.checkout:
      return "Check Out";
    case RoomStatus.reservation:
      return "Reserved";
    case RoomStatus.maintenance:
      return "Maintenance";
  }
}

Color _getStatusForeground(RoomStatus status) {
  switch (status) {
    case RoomStatus.checkin:
      return Colors.green[700]!;
    case RoomStatus.checkout:
      return Colors.red[700]!;
    case RoomStatus.reservation:
      return Colors.blue[700]!;
    case RoomStatus.maintenance:
      return Colors.orange[700]!;
  }
}

Color _getIconBackground(RoomStatus status) {
  switch (status) {
    case RoomStatus.checkin:
      return Colors.green.shade50;
    case RoomStatus.checkout:
      return Colors.red.shade50;
    case RoomStatus.reservation:
      return Colors.blue.shade50;
    case RoomStatus.maintenance:
      return Colors.orange.shade50;
  }
}

enum RoomStatus { checkin, checkout, reservation, maintenance }
