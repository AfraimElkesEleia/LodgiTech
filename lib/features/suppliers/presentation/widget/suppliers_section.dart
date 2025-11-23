import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/core/constants/app_routes.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/routing/navigation.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/core/widgets/custom_drop_down_menu.dart';
import 'package:lodgitech/core/widgets/custom_search_bar.dart';
import 'package:lodgitech/features/suppliers/data/supplier_model.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/supplier_table.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/title_with_action_button.dart';

class SuppliersSection extends StatelessWidget {
  const SuppliersSection({super.key});
  static final List<SupplierModel> suppliers = [
    SupplierModel(
      name: "Fresh Foods Co.",
      category: "Food & Beverage",
      contactPerson: "Ahmed Hassan",
      email: "freshfoods@example.com",
      phone: "0123456789",
      address: "Cairo, Nasr City, Block 12",
      totalOrders: 45,
      totalSpend: 12000,
      avgOrderValue: 267.0,
      services: ["Vegetables", "Dairy", "Meat"],
      status: "Active",
    ),

    SupplierModel(
      name: "CleanPro Service",
      category: "Cleaning",
      contactPerson: "Sara Ali",
      email: "cleanpro@example.com",
      phone: "0112223344",
      address: "Giza, Dokki, Street 9",
      totalOrders: 27,
      totalSpend: 8000,
      avgOrderValue: 296.0,
      services: ["Deep Cleaning", "Laundry", "Housekeeping Supplies"],
      status: "Inactive",
    ),

    SupplierModel(
      name: "Tech Supplies Co.",
      category: "Electronics",
      contactPerson: "Mahmoud Samir",
      email: "techsupplies@example.com",
      phone: "0109988776",
      address: "Alexandria, Smouha District",
      totalOrders: 33,
      totalSpend: 15000,
      avgOrderValue: 455.0,
      services: ["POS Systems", "CCTV", "Smart Locks"],
      status: "Active",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWithActionButton(
            title: "Supplier Directory",
            subtitle: "Manage your hotel suppliers and vendors",
            buttonText: "Add Supplier",
            buttonIcon: FontAwesomeIcons.plus,
            onPressed: () {
              context.pushNamed(AppRoutes.newSupplier);
            },
          ),
          verticalSpace(10),
          Row(
            children: [
              CustomSearchBar(maxWidth: MediaQuery.sizeOf(context).width / 4),
              horizontalSpace(8),
              StringDropDownMenu(
                items: [
                  "All Categories",
                  "Food & Bevarage",
                  "HouesKeeping",
                  "Cleaning",
                  "Office Supplies",
                ],
                width: MediaQuery.sizeOf(context).width / 5,
              ),
              horizontalSpace(8),
              StringDropDownMenu(
                items: ["All Status", "Active", "InActive"],
                width: MediaQuery.sizeOf(context).width / 6.2,
              ),
            ],
          ),
          Center(
            child: SupplierTable(
              suppliers: suppliers,
              onView: (supplier) {
                context.pushNamed(
                  AppRoutes.supplierProfile,
                  arguments: supplier,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
