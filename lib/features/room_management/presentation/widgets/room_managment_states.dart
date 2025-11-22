import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/font_weight_helper.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/room_management/data/models/room_stats.dart';

class RoomManagmentStates extends StatelessWidget {
  final RoomStats roomStats;
  final MainAxisAlignment? mainAxisAlignment;
  const RoomManagmentStates({super.key, required this.roomStats,this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        mainAxisAlignment: mainAxisAlignment??MainAxisAlignment.start,
        children: [
          Text(
            roomStats.number.toString(),
            style: AppStyles.semiBold18Black(
              context,
            ).copyWith(color: roomStats.color),
          ),
          Text(
            roomStats.name,
            style: AppStyles.semiBold14Black(
              context,
            ).copyWith(fontWeight: FontWeightHelper.light, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
