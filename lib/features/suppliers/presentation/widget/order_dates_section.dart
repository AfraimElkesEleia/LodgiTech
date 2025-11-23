import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/date_time_fields.dart';
import 'package:lodgitech/core/herlper/spacing.dart';

class OrderDatesSection extends StatelessWidget {
  final DateTime? orderDate;
  final DateTime? deliveryDate;
  final Function(DateTime) onOrderDateChanged;
  final Function(DateTime) onDeliveryDateChanged;

  const OrderDatesSection({
    super.key,
    required this.orderDate,
    required this.deliveryDate,
    required this.onOrderDateChanged,
    required this.onDeliveryDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: CustomDateField(
              label: "Order Date",
              date: orderDate,
              onDateSelected: onOrderDateChanged,
            ),
          ),
          horizontalSpace(14),
          Expanded(
            child: CustomDateField(
              label: "Delivery Date",
              date: deliveryDate,
              onDateSelected: onDeliveryDateChanged,
            ),
          ),
        ],
      ),
    );
  }
}
