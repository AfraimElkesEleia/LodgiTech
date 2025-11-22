
import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/guest_managment/presentation/widgets/info_row.dart';

class GuestPreferencesSection extends StatelessWidget {
  const GuestPreferencesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Preferences & Notes",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          verticalSpace(16),
          InfoRow(
            title: "Room Preferences : ",
            value: "Non-smoking, High floor, Late check-out",
          ),
          InfoRow(
            title: "Staff Notes",
            value: "VIP guest, prefers ocean view rooms",
          ),
        ],
      ),
    );
  }
}
