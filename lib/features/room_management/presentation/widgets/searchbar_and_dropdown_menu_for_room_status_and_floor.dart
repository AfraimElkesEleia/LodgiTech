import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/features/room_management/presentation/widgets/room_status_drop_down_menu.dart';

class SearchbarAndDropdownMenuForRoomStatusAndFloor extends StatelessWidget {
  const SearchbarAndDropdownMenuForRoomStatusAndFloor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SearchBar(
          backgroundColor: WidgetStatePropertyAll(Color(0xFFF3F3F5)),
          hintText: "Search Room",
          constraints: BoxConstraints(maxWidth: 500, minHeight: 48),
          leading: Icon(FontAwesomeIcons.magnifyingGlass, color: Colors.grey),
          elevation: WidgetStatePropertyAll(0),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
          ),
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
