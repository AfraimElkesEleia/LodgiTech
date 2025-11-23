import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/widgets/custom_drop_down_menu.dart';
import 'package:lodgitech/core/widgets/custom_text_field.dart';
import 'package:lodgitech/features/suppliers/data/supplier_model.dart';

class NewSupplierScreen extends StatefulWidget {
  final SupplierModel? supplier;

  const NewSupplierScreen({super.key, this.supplier});

  @override
  State<NewSupplierScreen> createState() => _NewSupplierScreenState();
}

class _NewSupplierScreenState extends State<NewSupplierScreen> {
  late TextEditingController nameCtrl;
  late TextEditingController categoryCtrl;
  late TextEditingController contactPersonCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController phoneCtrl;
  late TextEditingController addressCtrl;
  late TextEditingController totalOrdersCtrl;
  late TextEditingController totalSpendCtrl;
  late TextEditingController avgOrderValueCtrl;

  List<String> services = [];
  final serviceCtrl = TextEditingController();

  String? selectedStatus;

  @override
  void initState() {
    super.initState();
    final isEdit = widget.supplier != null;
    final model = widget.supplier;

    nameCtrl = TextEditingController(text: isEdit ? model!.name : "");
    categoryCtrl = TextEditingController(text: isEdit ? model!.category : "");
    contactPersonCtrl = TextEditingController(
      text: isEdit ? model!.contactPerson : "",
    );
    emailCtrl = TextEditingController(text: isEdit ? model!.email : "");
    phoneCtrl = TextEditingController(text: isEdit ? model!.phone : "");
    addressCtrl = TextEditingController(text: isEdit ? model!.address : "");
    totalOrdersCtrl = TextEditingController(
      text: isEdit ? model!.totalOrders.toString() : "",
    );
    totalSpendCtrl = TextEditingController(
      text: isEdit ? model!.totalSpend.toString() : "",
    );
    avgOrderValueCtrl = TextEditingController(
      text: isEdit ? model!.avgOrderValue.toString() : "",
    );

    services = isEdit ? List.from(model!.services) : [];
    selectedStatus = isEdit ? model!.status : null;
  }

  void addService() {
    if (serviceCtrl.text.trim().isEmpty) return;
    setState(() {
      services.add(serviceCtrl.text.trim());
      serviceCtrl.clear();
    });
  }

  void removeService(int index) {
    setState(() {
      services.removeAt(index);
    });
  }

  Widget buildTextFieldRow(
    TextEditingController ctrl1,
    String label1,
    TextEditingController ctrl2,
    String label2, {
    TextInputType firstInputType = TextInputType.text,
    TextInputType secondInputType = TextInputType.text,
  }) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: ctrl1,
            label: label1,
            hintText: label1,
            keyboardType: firstInputType,
          ),
        ),
        horizontalSpace(10),
        Expanded(
          child: CustomTextField(
            controller: ctrl2,
            label: label2,
            hintText: label2,
            keyboardType: secondInputType,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.supplier != null;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ─── TITLE ─────────────────────────
            Text(
              isEdit ? "Edit Supplier" : "New Supplier",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            verticalSpace(10),
            Text(
              isEdit ? "Update supplier details" : "Add a new supplier",
              style: const TextStyle(color: Colors.grey),
            ),
            verticalSpace(30),

            /// ─── BASIC INFORMATION ─────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: "Supplier Name",
                    label: "Company name",
                    controller: nameCtrl,
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: StringDropDownMenu(
                    items: [
                      "All Categories",
                      "Food & Bevarage",
                      "HouesKeeping",
                      "Cleaning",
                      "Office Supplies",
                    ],
                    width: double.infinity,
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            buildTextFieldRow(
              contactPersonCtrl,
              "Contact Person",
              emailCtrl,
              "Email",
              firstInputType: TextInputType.name,
              secondInputType: TextInputType.emailAddress,
            ),
            verticalSpace(10),
            buildTextFieldRow(
              phoneCtrl,
              "Phone",
              addressCtrl,
              "Address",
              firstInputType: TextInputType.phone,
              secondInputType: TextInputType.streetAddress,
            ),
            verticalSpace(20),
            const Divider(),
            verticalSpace(20),

            /// ─── STATISTICS ─────────────────────
            Text(
              "Statistics",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            verticalSpace(10),
            buildTextFieldRow(
              totalOrdersCtrl,
              "Total Orders",
              totalSpendCtrl,
              "Total Spend",
              firstInputType: TextInputType.number,
              secondInputType: TextInputType.number,
            ),
            verticalSpace(10),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    keyboardType: TextInputType.number,
                    controller: avgOrderValueCtrl,
                    label: "Avg Order Value",
                    hintText: "Avg Order Value",
                  ),
                ),
              ],
            ),
            verticalSpace(20),
            const Divider(),
            verticalSpace(20),

            /// ─── SERVICES ───────────────────────
            Text(
              "Products & Services",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            verticalSpace(10),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: serviceCtrl,
                    label: "Add a Service",
                    hintText: "e.g. Fresh Produce",
                  ),
                ),
                horizontalSpace(10),
                ElevatedButton(onPressed: addService, child: Text("Add")),
              ],
            ),
            verticalSpace(10),
            if (services.isNotEmpty)
              Wrap(
                spacing: 10,
                children: List.generate(
                  services.length,
                  (i) => Chip(
                    label: Text(services[i]),
                    deleteIcon: Icon(Icons.close),
                    onDeleted: () => removeService(i),
                  ),
                ),
              ),
            verticalSpace(20),
            const Divider(),
            verticalSpace(20),

            /// ─── STATUS DROPDOWN ───────────────
            StringDropDownMenu(
              items: const ["Active", "Inactive"],
              initialSelection: selectedStatus,
              onSelected: (v) => setState(() => selectedStatus = v),
              hintText: "Select Status",
              width: double.infinity,
              backgroundColor: const Color(0xFFF3F3F5),
              borderRadius: BorderRadius.circular(12),
            ),
            verticalSpace(30),

            /// ─── SUBMIT BUTTON ─────────────────
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.black,
                ),
                child: Text(
                  isEdit ? "Save Changes" : "Create Supplier",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
