import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDateField extends StatelessWidget {
  final String label;
  final DateTime? date;
  final void Function(DateTime) onDateSelected;
  final TextEditingController? controller;

  const CustomDateField({
    super.key,
    required this.label,
    this.date,
    this.controller,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () async {
            DateTime now = DateTime.now();
            final selected = await showDatePicker(
              context: context,
              initialDate: date ?? now,
              firstDate: DateTime(2020),
              lastDate: DateTime(2035),
            );

            if (selected != null) {
              onDateSelected(selected);
            }
          },
          icon: Icon(FontAwesomeIcons.calendar),
        ),
        labelText: label,
        hintText: date == null
            ? "Select date"
            : "${date!.month}/${date!.day}/${date!.year}",
        filled: true,
        fillColor: const Color(0xFFF3F3F5),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey, width: 2),
        ),
      ),
    );
  }
}
