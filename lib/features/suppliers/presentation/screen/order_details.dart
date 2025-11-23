import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/features/suppliers/data/order_model.dart';

class OrderDetails extends StatelessWidget {
  final OrderModel orderModel;
  const OrderDetails({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Purchase Order ${orderModel.id}",
                style: AppStyles.semiBold18Black(context),
              ),
              Text(
                "Order details and line items",
                style: AppStyles.normal16Grey(context).copyWith(fontSize: 14),
              ),
              verticalSpace(15),

              /// ─────────────── Order Details ───────────────
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Supplier",
                          style: AppStyles.semiBold14Black(context),
                        ),
                        Text(orderModel.supplierName),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order Date",
                          style: AppStyles.semiBold14Black(context),
                        ),
                        Text(formatDate(orderModel.orderDate)),
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expected Delivery",
                          style: AppStyles.semiBold14Black(context),
                        ),
                        Text(formatDate(orderModel.deliveryDate)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Status",
                          style: AppStyles.semiBold14Black(context),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(orderModel.status),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              verticalSpace(12),
              Divider(),
              verticalSpace(12),

              /// ─────────────── Items Table ───────────────
              Text("Items", style: AppStyles.semiBold14Black(context)),
              verticalSpace(10),

              _buildItemsTable(context),

              verticalSpace(16),
              Divider(),
              verticalSpace(16),

              /// ─────────────── Summary Section ───────────────
              _buildSummaryRow("Subtotal", orderModel.subtotal),
              _buildSummaryRow("Tax", orderModel.tax),
              _buildSummaryRow("Total", orderModel.total),

              verticalSpace(16),
              Divider(),
              verticalSpace(10),

              /// ─────────────── Notes Section ───────────────
              Text("Notes", style: AppStyles.semiBold14Black(context)),
              Text(orderModel.notes, style: AppStyles.normal16Grey(context)),
              Text("Subtotal: \$${orderModel.subtotal.toStringAsFixed(2)}"),
              Text("Tax: \$${orderModel.tax.toStringAsFixed(2)}"),
              Text("Total: \$${orderModel.total.toStringAsFixed(2)}"),
              Text("Note: ${orderModel.notes}"),

              // Add button here
              verticalSpace(20),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                  label: Text("Edit Order"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Format Date YYYY-MM-DD
  String formatDate(DateTime date) {
    final year = date.year;
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  /// ─────────────── Helper: Items Table ───────────────
  Widget _buildItemsTable(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey.shade300),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
      },
      children: [
        /// Header row
        TableRow(
          decoration: BoxDecoration(color: Colors.grey.shade200),
          children: [
            _tableHeader("Product", context),
            _tableHeader("Quantity", context),
            _tableHeader("Price", context),
          ],
        ),

        /// Data rows
        for (var item in orderModel.items)
          TableRow(
            children: [
              _tableCell(item.productName),
              _tableCell(item.quantity),
              _tableCell("\$${item.price.toStringAsFixed(2)}"),
            ],
          ),
      ],
    );
  }

  Widget _tableHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title, style: AppStyles.semiBold14Black(context)),
    );
  }

  Widget _tableCell(String value) {
    return Padding(padding: const EdgeInsets.all(8.0), child: Text(value));
  }

  Widget _buildSummaryRow(String label, double amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            "\$${amount.toStringAsFixed(2)}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
