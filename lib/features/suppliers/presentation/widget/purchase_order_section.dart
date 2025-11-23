import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/suppliers/data/order_model.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/order_table.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/title_with_action_button.dart';

class PurchaseOrderSection extends StatelessWidget {
  const PurchaseOrderSection({super.key});
  static final ordersList = [
    OrderModel(
      id: "PO001",
      supplierName: "ABC Supplies",
      supplierEmail: "abc@supplies.com",
      orderDate: DateTime(2025, 11, 20),
      deliveryDate: DateTime(2025, 11, 25),
      status: "Pending",
      total: 1200.50,
    ),
    OrderModel(
      id: "PO002",
      supplierName: "Food & Beverages Co.",
      supplierEmail: "contact@fnb.com",
      orderDate: DateTime(2025, 11, 21),
      deliveryDate: DateTime(2025, 11, 28),
      status: "Confirmed",
      total: 980.00,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          TitleWithActionButton(
            title: "Purchase Orders",
            subtitle: "Track and manage all procurement orders",
            buttonText: "Add Order",
            buttonIcon: FontAwesomeIcons.plus,
            onPressed: () {},
          ),
          verticalSpace(10),
          OrdersTable(orders: ordersList, onView: (order) {}),
        ],
      ),
    );
  }
}
