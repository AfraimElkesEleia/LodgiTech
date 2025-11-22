
import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/guest_managment/data/models/guest.dart';
import 'package:lodgitech/features/guest_managment/presentation/widgets/guest_statistics.dart';

class GuestStatisticsSection extends StatelessWidget {
  const GuestStatisticsSection({
    super.key,
    required this.guest,
  });

  final Guest guest;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Guest Statisitcs",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Row(
            children: [
              GuestStatistics(
                number: guest.totalStays.toString(),
                title: "Total Stays",
              ),
              GuestStatistics(
                number: guest.totalSpent.toString(),
                title: "Total Spent",
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Average Stay Value : ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: (guest.totalSpent / guest.totalStays)
                      .floor()
                      .toString(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
