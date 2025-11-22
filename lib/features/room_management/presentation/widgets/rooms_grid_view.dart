import 'package:flutter/material.dart';
import 'package:lodgitech/features/room_management/data/models/room_status.dart';
import 'package:lodgitech/features/room_management/presentation/widgets/room_managment_card.dart';

class RoomsGridView extends StatelessWidget {
  const RoomsGridView({
    super.key,
    required this.rooms,
    this.crossAxisCount = 4,
    this.aspectRatio = 1 / 1.7,
    this.crossAxisSpacing = 15,
    this.mainAxisSpacing = 15,
    this.padding,
  });

  final List<Room> rooms;
  final int crossAxisCount;
  final double aspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding ?? const EdgeInsets.all(0),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: aspectRatio,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
        ),
        itemCount: rooms.length,
        itemBuilder: (ctx, index) {
          return RoomManagementCard(room: rooms[index]);
        },
      ),
    );
  }
}
