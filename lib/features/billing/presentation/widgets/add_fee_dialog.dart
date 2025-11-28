import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/custom_drop_down_menu.dart';
import 'package:lodgitech/features/billing/data/models/fee_item.dart';

class AddFeeDialog extends StatefulWidget {
  final Function(FeeItem) onSubmit;

  const AddFeeDialog({super.key, required this.onSubmit});

  @override
  State<AddFeeDialog> createState() => _AddFeeDialogState();
}

class _AddFeeDialogState extends State<AddFeeDialog> {
  FeeType selectedType = FeeType.roomService;
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Fee"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // DropdownButton<FeeType>(
          //   value: selectedType,
          //   onChanged: (value) {
          //     if (value != null) {
          //       setState(() {
          //         selectedType = value;
          //       });
          //     }
          //   },
          //   items: FeeType.values
          //       .map((e) => DropdownMenuItem(
          //             value: e,
          //             child: Text(e.label),
          //           ))
          //       .toList(),
          // ),
          CustomDropDownMenu<FeeType>(
            initialSelection: selectedType,
            onSelected: (value) {
              if (value != null) {
                setState(() {
                  selectedType = value;
                });
              }
            },
            dropdownMenuEntries: FeeType.values
                .map(
                  (fee) => DropdownMenuEntry(
                    value: fee,
                    label: fee.name,
                    labelWidget: Text(fee.label),
                  ),
                )
                .toList(),
          ),

          TextField(
            controller: amountController,
            decoration: const InputDecoration(labelText: "Amount"),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            final item = FeeItem(
              type: selectedType,
              amount: double.tryParse(amountController.text.trim()) ?? 0,
            );
            widget.onSubmit(item);
            Navigator.pop(context);
          },
          child: const Text("Add"),
        ),
      ],
    );
  }
}
