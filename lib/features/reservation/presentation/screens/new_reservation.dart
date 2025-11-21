import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/widgets/custom_drop_down_menu.dart';
import 'package:lodgitech/core/widgets/custom_text_field.dart';
import 'package:lodgitech/features/reservation/presentation/widgets/date_time_fields.dart';

class NewReservation extends StatelessWidget {
  const NewReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Reservation",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              ),
              verticalSpace(12),
              Text(
                "Add a new guest reservation to the system",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              verticalSpace(12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hintText: "Enter guest name",
                        label: "Guest Name",
                      ),
                    ),
                    horizontalSpace(14),
                    Expanded(
                      child: CustomTextField(
                        hintText: "guest@email.com",
                        label: "Guest Email",
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hintText: "+20(1256895687)",
                        label: "Phone",
                      ),
                    ),
                    horizontalSpace(14),
                    Expanded(
                      child: StringDropDownMenu(
                        hintText: "Select guests",
                        width: double.infinity,
                        items: ["1 Guest", "2 Guests", "3 Guests", "4 Guests"],
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CustomDateField(
                        label: "Check In",
                        onDateSelected: (date) {},
                      ),
                    ),
                    horizontalSpace(14),
                    Expanded(
                      child: CustomDateField(
                        label: "Check In",
                        onDateSelected: (date) {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: StringDropDownMenu(
                        hintText: "Select room type",
                        items: [
                          "Standard Room",
                          "Deluxe Room",
                          "Suite",
                          "Premium Suite",
                        ],
                        width: double.infinity,
                      ),
                    ),
                    horizontalSpace(14),
                    Expanded(
                      child: CustomTextField(
                        hintText: "Any special requirements",
                        label: "Special Requests",
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(8),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                  padding: EdgeInsets.all(16),
                  minimumSize: Size(double.infinity, 25),
                ),
                child: Text(
                  "Create Reservation",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
