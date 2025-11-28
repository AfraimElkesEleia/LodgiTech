
import 'package:flutter/material.dart';
import 'package:lodgitech/features/billing/data/models/billing_block_item.dart';
import 'package:lodgitech/features/billing/presentation/widgets/billing_statistics_item.dart';

class BillingStatisticsList extends StatelessWidget {
  final List<BillingBlockItem> billings;
  const BillingStatisticsList({super.key, required this.billings});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 6,
      child: Row(
        children: List.generate(3, (index) {
          return Expanded(
            child: BillingStatisticsItem(billing: billings[index]),
          );
        }),
      ),
    );
  }
}
