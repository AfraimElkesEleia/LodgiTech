import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/custom_drop_down_menu.dart';
class RoomStatusDropDownMenu extends StatelessWidget {
  final List<String> statusList;
  final ValueChanged<String?>? onStatusChanged;
  final double? width;
  final Widget? leadingIcon;

  const RoomStatusDropDownMenu({
    super.key,
    required this.statusList,
    this.onStatusChanged,
    this.width = 200,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return StringDropDownMenu(
      items: statusList,
      onSelected: onStatusChanged,
      width: width,
      leadingIcon: leadingIcon,
      initialSelection: statusList.first.toLowerCase(),
      valueTransformer: (status) => status.toLowerCase().replaceAll(' ', '_'),
    );
  }
}
