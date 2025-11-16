
import 'package:flutter/material.dart';
import 'package:lodgitech/features/dashboard/data/models/custom_drawer_item_model.dart';

class CustomDrawerItem extends StatelessWidget {
  final bool isActive;
  final CustomDrawerItemModel customDrawerItemModel;
  const CustomDrawerItem({
    super.key,
    required this.isActive,
    required this.customDrawerItemModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: ShapeDecoration(
        color: isActive ? Color(0xFFF5F5F5) : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
      child: ListTile(
        minLeadingWidth: 0,
        leading: Icon(customDrawerItemModel.icon, size: 18),
        title: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            customDrawerItemModel.name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isActive ? FontWeight.w800 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
