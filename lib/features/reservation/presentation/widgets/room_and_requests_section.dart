import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/widgets/custom_drop_down_menu.dart';
import 'package:lodgitech/core/widgets/custom_text_field.dart';

class RoomAndRequestsSection extends StatelessWidget {
  final String? selectedRoom;
  final Function(String?) onRoomSelected;
  final TextEditingController specialRequestsController;

  const RoomAndRequestsSection({
    super.key,
    required this.selectedRoom,
    required this.onRoomSelected,
    required this.specialRequestsController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: StringDropDownMenu(
              hintText: "Select room type",
              items: const [
                "Standard Room",
                "Deluxe Room",
                "Suite",
                "Premium Suite",
              ],
              width: double.infinity,
              initialSelection: selectedRoom,
              onSelected: onRoomSelected,
            ),
          ),
          horizontalSpace(14),
          Expanded(
            child: CustomTextField(
              controller: specialRequestsController,
              hintText: "Any special requirements",
              label: "Special Requests",
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
