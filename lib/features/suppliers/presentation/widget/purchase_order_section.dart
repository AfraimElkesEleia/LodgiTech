import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/core/constants/app_routes.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/routing/navigation.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/suppliers/data/order_model.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/order_table.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/title_with_action_button.dart';

class PurchaseOrderSection extends StatelessWidget {
  const PurchaseOrderSection({super.key});
  static final List<OrderModel> ordersList = [
    OrderModel.fromItems(
      id: 'PO-2024-001',
      supplierName: 'Fresh Foods Wholesale',
      supplierEmail: 'contact@freshfoods.com',
      orderDate: DateTime(2024, 10, 12),
      deliveryDate: DateTime(2024, 10, 14),
      status: 'Delivered',
      notes: 'Delivered on time',
      items: [
        OrderItem(
          productName: 'Fresh Vegetables',
          quantity: '50 kg',
          price: 150.0,
        ),
        OrderItem(
          productName: 'Dairy Products',
          quantity: '100 units',
          price: 300.0,
        ),
        OrderItem(productName: 'Fresh Meat', quantity: '30 kg', price: 450.0),
      ],
    ),

    OrderModel.fromItems(
      id: 'PO-2024-002',
      supplierName: 'Tech Gadgets Inc',
      supplierEmail: 'sales@techgadgets.com',
      orderDate: DateTime(2024, 11, 5),
      deliveryDate: DateTime(2024, 11, 10),
      status: 'Processing',
      notes: 'Awaiting shipment',
      items: [
        OrderItem(
          productName: 'Wireless Keyboards',
          quantity: '40 units',
          price: 1200.0,
        ),
        OrderItem(
          productName: 'Bluetooth Headsets',
          quantity: '25 units',
          price: 750.0,
        ),
        OrderItem(
          productName: 'USB-C Cables',
          quantity: '100 units',
          price: 300.0,
        ),
      ],
    ),

    OrderModel.fromItems(
      id: 'PO-2024-003',
      supplierName: 'Fashion Retail Hub',
      supplierEmail: 'support@fashionhub.com',
      orderDate: DateTime(2024, 9, 20),
      deliveryDate: DateTime(2024, 9, 25),
      status: 'Cancelled',
      notes: 'Order cancelled by supplier due to stock issues',
      items: [
        OrderItem(
          productName: 'Summer T-Shirts',
          quantity: '200 pcs',
          price: 1800.0,
        ),
        OrderItem(
          productName: 'Jeans Pants',
          quantity: '120 pcs',
          price: 2400.0,
        ),
        OrderItem(productName: 'Sneakers', quantity: '80 pairs', price: 3200.0),
      ],
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
            onPressed: () {
              context.pushNamed(AppRoutes.newOrderScreen);
            },
          ),
          verticalSpace(10),
          OrdersTable(
            orders: ordersList,
            onView: (order) {
              context.pushNamed(AppRoutes.orderDetails, arguments: order);
            },
            onEdit: (order) {
              context.pushNamed(AppRoutes.newOrderScreen, arguments: order);
            },
          ),
        ],
      ),
    );
  }
}
