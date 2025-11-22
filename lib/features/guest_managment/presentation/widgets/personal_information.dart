import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/guest_managment/data/models/guest.dart';
import 'package:lodgitech/features/guest_managment/presentation/widgets/info_row.dart';

class PersonalInformation extends StatelessWidget {
  final Guest guest;
  const PersonalInformation({super.key, required this.guest});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Personal Information",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          verticalSpace(16),
          InfoRow(title: "Full Name", value: guest.name),
          InfoRow(title: "Date of Birth", value: formatDate(guest.dateOfBirth)),
          InfoRow(title: "Nationality", value: guest.nationality),
          InfoRow(title: "ID Type", value: guest.idType.toString().split('.').last),
          InfoRow(title: "Address", value: guest.address),
        ],
      ),
    );
  }

  String formatDate(DateTime date) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final day = twoDigits(date.day);
    final month = twoDigits(date.month);
    final year = date.year.toString();
    return '$day/$month/$year';
  }
}