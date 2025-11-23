import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/core/widgets/custom_drop_down_menu.dart';
import 'package:lodgitech/core/widgets/custom_search_bar.dart';
import 'package:lodgitech/features/suppliers/data/supplier_model.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/supplier_table.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/title_with_action_button.dart';

class SuppliersSection extends StatelessWidget {
  const SuppliersSection({super.key});
  static final suppliers = [
    SupplierModel(
      name: "Fresh Foods Co.",
      category: "Food & Bevarage",
      contact: "0123456789",
      totalSpend: 12000,
      status: "Active",
      email: "john@example.com",
    ),
    SupplierModel(
      name: "CleanPro Service",
      category: "Cleaning",
      contact: "0112223344",
      totalSpend: 8000,
      status: "Inactive",
      email: "john@example.com",
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
            onPressed: () {},
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
            child: SupplierTable(suppliers: suppliers, onView: (supplier) {}),
          ),
        ],
      ),
    );
  }
}
