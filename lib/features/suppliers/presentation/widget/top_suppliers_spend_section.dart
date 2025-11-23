
import 'package:flutter/material.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/suppliers/data/business_info.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/top_supplier_info_card.dart';

class TopSuppliersSpendSection extends StatelessWidget {
  const TopSuppliersSpendSection({
    super.key,
    required this.businesses,
  });

  final List<BusinessInfo> businesses;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Suppliers by Spend",
            style: AppStyles.semiBold14Black(context),
          ),
          Text(
            "Highest spending suppliers",
            style: AppStyles.extraLight14Grey(context),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: businesses.length,
            itemBuilder: (context, index) {
              return TopSupplierInfoCard(businessInfo: businesses[index]);
            },
          ),
        ],
      ),
    );
  }
}
