
import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/order_volume_chart.dart';

class OrderVolumeSection extends StatelessWidget {
  const OrderVolumeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Volume",
            style: AppStyles.semiBold14Black(context),
          ),
          Text(
            "Number of orders per month",
            style: AppStyles.extraLight14Grey(context),
          ),
          verticalSpace(12),
          AspectRatio(
            aspectRatio: 2 / 1,
            child: OrderVolumeChart(),
          ),
        ],
      ),
    );
  }
}