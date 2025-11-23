import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/suppliers/data/business_info.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/charts_analytics_suppliers_desktop_layout.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/charts_analytics_suppliers_mobile_layout.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/monthly_spend_chart.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/monthly_spend_trend_section.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/order_volume_chart.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/order_volume_section.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/top_supplier_info_card.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/top_suppliers_spend_section.dart';

class AnalyticsSection extends StatelessWidget {
  const AnalyticsSection({super.key});
  static final List<BusinessInfo> businesses = [
    BusinessInfo(
      id: '1',
      title: 'Fresh Foods Wholesale',
      category: 'Food & Beverage',
      amount: '\$125,000',
      secondaryInfo: '145 orders',
    ),
    BusinessInfo(
      id: '2',
      title: 'Tech Gadgets Inc',
      category: 'Electronics',
      amount: '\$89,500',
      secondaryInfo: '92 orders',
    ),
    BusinessInfo(
      id: '3',
      title: 'Fashion Retail',
      category: 'Clothing',
      amount: '\$67,800',
      secondaryInfo: '78 orders',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final bool isMobileOrTablet = width <= 1300;
    return Column(
      children: [
        isMobileOrTablet
            ? const ChartsAnalyticsSuppliersMobileLayout()
            : const ChartsAnalyticsSuppliersDesktopLayout(),
        TopSuppliersSpendSection(businesses: businesses),
      ],
    );
  }
}
