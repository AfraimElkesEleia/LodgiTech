import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/widgets/custom_drop_down_menu.dart';
import 'package:lodgitech/core/widgets/custom_text_field.dart';
import 'package:lodgitech/core/widgets/date_time_fields.dart';

class AddNewGuest extends StatelessWidget {
  const AddNewGuest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add New Guest",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                verticalSpace(12),
                Text(
                  "Create a new guest profile in the system",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                verticalSpace(12),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hintText: "Enter guest name",
                        label: "Full name",
                      ),
                    ),
                    horizontalSpace(12),
                    Expanded(
                      child: CustomTextField(
                        hintText: "Email",
                        label: "guest@gmail.com",
                      ),
                    ),
                  ],
                ),
                verticalSpace(12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hintText: "+20(1258798741)",
                        label: "Phone",
                      ),
                    ),
                    horizontalSpace(12),
                    Expanded(
                      child: CustomDateField(
                        label: "Enter of Birth",
                        onDateSelected: (date) {},
                      ),
                    ),
                  ],
                ),
                verticalSpace(12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hintText: "Egyptian",
                        label: "Nationality",
                      ),
                    ),
                    horizontalSpace(12),
                    Expanded(
                      child: StringDropDownMenu(
                        width: double.infinity,
                        items: ["Passport", "Driving License", "National ID"],
                      ),
                    ),
                  ],
                ),
                verticalSpace(12),
                CustomTextField(hintText: "Full Address", label: "Address"),
                verticalSpace(12),
                CustomTextField(
                  hintText: "Guest preferences and special requirements",
                  label: "Prefernces",
                  minLines: 3,
                  maxLines: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
