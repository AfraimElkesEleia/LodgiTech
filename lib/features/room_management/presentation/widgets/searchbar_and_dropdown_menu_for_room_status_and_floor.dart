import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/custom_search_bar.dart';
import 'package:lodgitech/features/room_management/presentation/widgets/room_status_drop_down_menu.dart';

class SearchbarAndDropdownMenuForRoomStatusAndFloor extends StatelessWidget {
  const SearchbarAndDropdownMenuForRoomStatusAndFloor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSearchBar(
          hintText: "Search Rooms...",
          maxWidth: MediaQuery.sizeOf(context).width / 3,
        ),
        SizedBox(width: 20),
        RoomStatusDropDownMenu(
          statusList: [
            'All Status',
            'Available',
            'Occupied',
            'Cleaning',
            'Maintenance',
          ],
        ),
        SizedBox(width: 20),
        RoomStatusDropDownMenu(
          statusList: [
            'All Status',
            'Available',
            'Occupied',
            'Cleaning',
            'Maintenance',
          ],
        ),
      ],
    );
  }
}
