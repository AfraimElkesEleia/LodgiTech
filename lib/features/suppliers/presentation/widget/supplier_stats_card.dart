import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/features/suppliers/data/supplier_stats.dart';

class SupplierStatsCard extends StatelessWidget {
  final SupplierStats stats;
  const SupplierStatsCard({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(stats.title, style: AppStyles.light12Black(context)),
              stats.icon,
            ],
          ),
          const Spacer(),
          Text(stats.value, style: AppStyles.semiBold14Black(context)),
          Text(
            stats.subtitle,
            style: AppStyles.light12Black(context).copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
