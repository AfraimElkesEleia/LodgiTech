import 'package:flutter/material.dart';
import 'package:lodgitech/features/billing/data/models/billing_block_item.dart';
import 'package:lodgitech/features/billing/presentation/widgets/billing_statistics_item.dart';

class BillingStatisticsList extends StatelessWidget {
  final List<BillingBlockItem> billings;
  const BillingStatisticsList({super.key, required this.billings});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width > 1300) {
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
    } else if (width > 800 && width <= 1300) {
      return GridView.builder(
        itemCount: billings.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return BillingStatisticsItem(billing: billings[index]);
        },
      );
    } else {
      return Column(
        children: List.generate(billings.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Expanded(
              child: AspectRatio(
                aspectRatio: 3,
                child: BillingStatisticsItem(billing: billings[index]),
              ),
            ),
          );
        }),
      );
    }
  }
}
