import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/widgets/custom_drop_down_menu.dart';
import 'package:lodgitech/core/widgets/custom_text_field.dart';

class PhoneAndGuestsSection extends StatelessWidget {
  final TextEditingController phoneController;
  final String? selectedGuests;
  final Function(String?) onSelectGuests;

  const PhoneAndGuestsSection({
    super.key,
    required this.phoneController,
    required this.selectedGuests,
    required this.onSelectGuests,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              controller: phoneController,
              hintText: "+20(1256895687)",
              label: "Phone",
              keyboardType: TextInputType.phone,
            ),
          ),
          horizontalSpace(14),
          Expanded(
            child: StringDropDownMenu(
              hintText: "Select guests",
              width: double.infinity,
              initialSelection: selectedGuests,
              items: const [
                "1 Guest",
                "2 Guests",
                "3 Guests",
                "4 Guests",
              ],
              onSelected: onSelectGuests,
            ),
          ),
        ],
      ),
    );
  }
}
