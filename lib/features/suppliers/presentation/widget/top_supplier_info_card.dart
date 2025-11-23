import 'package:flutter/material.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/suppliers/data/business_info.dart';

class TopSupplierInfoCard extends StatelessWidget {
  final BusinessInfo businessInfo;
  const TopSupplierInfoCard({super.key, required this.businessInfo});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: const EdgeInsets.all(12), // Increased padding for better spacing
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '#${businessInfo.id}',
              style: AppStyles.bold16Black(context),
            ),
          ),

          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  businessInfo.title,
                  style: AppStyles.bold16Black(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  businessInfo.category,
                  style: AppStyles.extraLight14Grey(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Flexible(child: Container()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                businessInfo.amount,
                style: AppStyles.semiBold14Black(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 2),
              Text(
                businessInfo.secondaryInfo,
                style: AppStyles.light12Black(
                  context,
                ).copyWith(color: Colors.grey[600]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
