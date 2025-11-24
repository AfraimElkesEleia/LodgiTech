import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/widgets/custom_text_field.dart';

class GuestInfoSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;

  const GuestInfoSection({
    super.key,
    required this.nameController,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              controller: nameController,
              hintText: "Enter guest name",
              label: "Guest Name",
              validator: (value) =>
                  (value == null || value.isEmpty) ? 'Please enter guest name' : null,
            ),
          ),
          horizontalSpace(14),
          Expanded(
            child: CustomTextField(
              controller: emailController,
              hintText: "guest@email.com",
              label: "Guest Email",
              validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter email';
                if (!value.contains('@')) return 'Please enter a valid email';
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
