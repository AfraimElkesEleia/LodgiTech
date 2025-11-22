
import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/guest_managment/data/models/guest.dart';
import 'package:lodgitech/features/guest_managment/presentation/widgets/info_row.dart';
import 'package:lodgitech/features/guest_managment/presentation/widgets/loyality_tag.dart';
import 'package:lodgitech/features/guest_managment/presentation/widgets/status_tag.dart';

class ContactAndStatus extends StatelessWidget {
  const ContactAndStatus({
    super.key,
    required this.guest,
  });

  final Guest guest;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact & Status",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          verticalSpace(16),
          InfoRow(title: "Email", value: guest.email),
          InfoRow(title: "Phone", value: guest.contact),
          verticalSpace(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Current Status",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              verticalSpace(8),
              StatusTag(status: guest.currentStatus),
              verticalSpace(12),
              Text(
                "Loyalty Tier",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              verticalSpace(8),
              LoyaltyTag(tier: guest.loyaltyTier),
            ],
          ),
        ],
      ),
    );
  }
}
