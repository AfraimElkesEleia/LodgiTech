import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/room_type_distribution_cart.dart';

class RoomTypeDistributionChartSection extends StatelessWidget {
  const RoomTypeDistributionChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Room Type Distribution",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18
            ),
          ),
          SizedBox(height: 6),
          Text(
            "Current room bookings by type",
            style: TextStyle(color: Colors.grey),
          ),
          RoomTypeDistributionChart(),
        ],
      ),
    );
  }
}
