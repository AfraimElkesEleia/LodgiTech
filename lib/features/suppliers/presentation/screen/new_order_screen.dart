import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/widgets/custom_text_field.dart';
import 'package:lodgitech/features/suppliers/data/order_model.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/order_dates_section.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/order_submit_button.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/order_supplier_status_section.dart';

class NewOrderScreen extends StatefulWidget {
  final OrderModel? order; 

  const NewOrderScreen({super.key, this.order});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  late TextEditingController supplierCtrl;
  late TextEditingController totalCtrl;
  String? selectedStatus;
  DateTime? orderDate;
  DateTime? deliveryDate;

  /// Items list (for edit mode, load from orderModel)
  late List<OrderItem> items;

  @override
  void initState() {
    super.initState();

    final isEdit = widget.order != null;

    supplierCtrl = TextEditingController(
      text: isEdit ? widget.order!.supplierName : "",
    );

    totalCtrl = TextEditingController(
      text: isEdit ? widget.order!.total.toStringAsFixed(2) : "",
    );

    selectedStatus = isEdit ? widget.order!.status : null;

    orderDate = isEdit ? widget.order!.orderDate : null;
    deliveryDate = isEdit ? widget.order!.deliveryDate : null;

    items = isEdit ? List.from(widget.order!.items) : [];
  }

  void addItem() {
    showDialog(
      context: context,
      builder: (context) {
        final nameCtrl = TextEditingController();
        final qtyCtrl = TextEditingController();
        final priceCtrl = TextEditingController();

        return AlertDialog(
          title: Text("Add Item"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                label: "Product Name",
                hintText: "e.g. Fresh Meat",
                controller: nameCtrl,
              ),
              CustomTextField(
                label: "Quantity",
                hintText: "e.g. 10 kg",
                controller: qtyCtrl,
              ),
              CustomTextField(
                label: "Price",
                hintText: "e.g. 150.0",
                controller: priceCtrl,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  items.add(
                    OrderItem(
                      productName: nameCtrl.text,
                      quantity: qtyCtrl.text,
                      price: double.tryParse(priceCtrl.text) ?? 0,
                    ),
                  );
                });
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.order != null;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text(
                  isEdit ? "Edit Order" : "New Order",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                verticalSpace(12),
                Text(
                  isEdit
                      ? "Update this purchase order"
                      : "Add a new purchase order",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                verticalSpace(12),
                OrderSupplierStatusSection(supplierController: supplierCtrl),
                OrderDatesSection(
                  orderDate: orderDate,
                  deliveryDate: deliveryDate,
                  onDeliveryDateChanged: (date) {},
                  onOrderDateChanged: (date) {},
                ),

                /// Items Table (Edit Mode or New Mode)
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Items",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(onPressed: addItem, child: Text("Add Item")),
                  ],
                ),
                verticalSpace(10),

                if (items.isNotEmpty)
                  Table(
                    border: TableBorder.all(color: Colors.grey.shade300),
                    columnWidths: {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(2),
                      3: FixedColumnWidth(50),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: Colors.grey.shade200),
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text("Product"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text("Quantity"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text("Price"),
                          ),
                          Padding(padding: EdgeInsets.all(8), child: Text("X")),
                        ],
                      ),
                      ...items.asMap().entries.map(
                        (e) => TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(e.value.productName),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(e.value.quantity),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text("\$${e.value.price}"),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => removeItem(e.key),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                verticalSpace(20),

                /// Create / Update Order Button
                OrderSubmitButton(
                  text: isEdit ? "Save Changes" : "Create Order",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}