import 'package:flutter/material.dart';
import 'package:lodgitech/features/room_management/data/models/room_status.dart';
import 'package:lodgitech/features/room_management/presentation/widgets/room_managment_card.dart';

class RoomsGridView extends StatelessWidget {
  const RoomsGridView({super.key, required this.rooms});

  final List<Room> rooms;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1 / 1.5,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: rooms.length,
      itemBuilder: (ctx, index) => RoomManagementCard(room: rooms[index]),
    );
  }
}
