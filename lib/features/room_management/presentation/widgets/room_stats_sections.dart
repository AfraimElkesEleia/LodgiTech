import 'package:flutter/material.dart';
import 'package:lodgitech/features/room_management/data/models/room_stats.dart';
import 'package:lodgitech/features/room_management/presentation/widgets/room_managment_states.dart';

class RoomStatsSection extends StatelessWidget {
  const RoomStatsSection({super.key, required this.roomStats});

  final List<RoomStats> roomStats;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: IntrinsicHeight(
        child: Row(
          children: roomStats.map((room) {
            return Expanded(child: RoomManagmentStates(roomStats: room));
          }).toList(),
        ),
      ),
    );
  }
}
