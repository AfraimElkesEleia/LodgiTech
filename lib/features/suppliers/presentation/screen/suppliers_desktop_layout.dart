import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/core/widgets/header_of_screen.dart';
import 'package:lodgitech/features/suppliers/data/supplier_stats.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/analytics_section.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/purchase_order_section.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/supplier_stats_grid.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/suppliers_section.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/toggle_suppliers_bar.dart';

class SuppliersDesktopLayout extends StatefulWidget {
  const SuppliersDesktopLayout({super.key});

  @override
  State<SuppliersDesktopLayout> createState() => _SuppliersDesktopLayoutState();
}

class _SuppliersDesktopLayoutState extends State<SuppliersDesktopLayout> {
  final List<SupplierStats> supplierStats = [
    SupplierStats(
      subtitle: "of 4 total",
      title: "Activ Suppliers",
      value: "3",
      icon: Icon(FontAwesomeIcons.cube),
    ),
    SupplierStats(
      subtitle: "+12.5% vs last period",
      title: "Total Spend",
      value: "\$260,000",
      icon: Icon(FontAwesomeIcons.moneyBill),
    ),
    SupplierStats(
      subtitle: "All time",
      title: "Total Orders",
      value: "435",
      icon: Icon(FontAwesomeIcons.paragraph),
    ),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: HeaderOfScreen(titleOfScreen: "Suppliers")),
          SupplierStatsGrid(
            stats: supplierStats,
            aspectRatio: MediaQuery.sizeOf(context).width <= 1300
                ? 2 / 1.5
                : 2 / 1,
            crossAxisCount: MediaQuery.sizeOf(context).width <= 800 ? 2 : 3,
          ),
          ToggleSuppliersBar(
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          SliverToBoxAdapter(child: _buildSelectedContent()),
        ],
      ),
    );
  }

  Widget _buildSelectedContent() {
    switch (selectedIndex) {
      case 0:
        return SuppliersSection();
      case 1:
        return PurchaseOrderSection();
      case 2:
        return AnalyticsSection();
      default:
        return SizedBox.shrink();
    }
  }
}
