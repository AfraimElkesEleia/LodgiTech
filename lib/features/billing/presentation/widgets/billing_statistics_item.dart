import 'package:flutter/material.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/billing/data/models/billing_block_item.dart';

class BillingStatisticsItem extends StatelessWidget {
  final BillingBlockItem billing;
  const BillingStatisticsItem({super.key, required this.billing});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                billing.title,
                style: AppStyles.semiBold14Black(
                  context,
                ).copyWith(fontSize: 12),
              ),
              Icon(billing.icon),
            ],
          ),
          Expanded(child: Container()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                billing.title == "Total Invoices"
                    ? "${billing.value}"
                    : "\$ ${billing.value}",
                style: AppStyles.semiBold14Black(context),
              ),
              Text(
                billing.description,
                style: AppStyles.light12Black(
                  context,
                ).copyWith(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
