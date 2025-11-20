import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/room_management/data/models/room_stats.dart';

class RoomManagmentStates extends StatelessWidget {
  final RoomStats roomStats;
  const RoomManagmentStates({super.key, required this.roomStats});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Text(
            roomStats.number.toString(),
            style: TextStyle(
              color: roomStats.color,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(roomStats.name),
        ],
      ),
    );
  }
}
