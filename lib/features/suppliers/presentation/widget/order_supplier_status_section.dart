import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/widgets/custom_drop_down_menu.dart';
import 'package:lodgitech/core/widgets/custom_text_field.dart';

class OrderSupplierStatusSection extends StatelessWidget {
  final TextEditingController supplierController;

  const OrderSupplierStatusSection({
    super.key,
    required this.supplierController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: CustomTextField(
              hintText: "Supplier name",
              label: "Supplier",
              controller: supplierController,
            ),
          ),
          horizontalSpace(14),
          Expanded(
            child: StringDropDownMenu(
              hintText: "Select status",
              width: double.infinity,
              items: const ["Pending", "Processing", "Delivered", "Cancelled"],
            ),
          ),
        ],
      ),
    );
  }
}
