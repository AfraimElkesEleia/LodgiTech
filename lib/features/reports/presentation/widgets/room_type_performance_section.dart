import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/reports/data/models/room_type_performance_model.dart';

class RoomTypePerformanceSection extends StatelessWidget {
  const RoomTypePerformanceSection({super.key});
  static final List<RoomTypePerformanceModel> rooms = [
    RoomTypePerformanceModel(
      title: "Standard",
      subtitle: 89,
      value: 26700,
      avg: 120,
    ),
    RoomTypePerformanceModel(
      title: "Deluxe",
      subtitle: 67,
      value: 32160,
      avg: 180,
    ),
    RoomTypePerformanceModel(
      title: "Suite",
      subtitle: 34,
      value: 98900,
      avg: 350,
    ),
    RoomTypePerformanceModel(
      title: "Premium",
      subtitle: 12,
      value: 26700,
      avg: 120,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Room Type Performance",
            style: AppStyles.semiBold14Black(context),
          ),
          Text(
            "Booking and revenue breakdown by room type",
            style: AppStyles.extraLight14Grey(context),
          ),
          verticalSpace(8),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) => CustomContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rooms[index].title,
                        style: AppStyles.semiBold14Black(context),
                      ),
                      Text(
                        "${rooms[index].subtitle} bookings",
                        style: AppStyles.light12Black(
                          context,
                        ).copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "\$${rooms[index].value}",
                        style: AppStyles.semiBold14Black(context),
                      ),
                      Text(
                        "Avg : ${rooms[index].avg}",
                        style: AppStyles.light12Black(
                          context,
                        ).copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
