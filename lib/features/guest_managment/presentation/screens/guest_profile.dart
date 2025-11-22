import 'package:flutter/material.dart';
import 'package:lodgitech/core/constants/app_routes.dart';
import 'package:lodgitech/core/routing/navigation.dart';
import 'package:lodgitech/features/guest_managment/data/models/guest.dart';
import 'package:lodgitech/features/guest_managment/presentation/widgets/contact_and_status.dart';
import 'package:lodgitech/features/guest_managment/presentation/widgets/current_stay_information.dart';
import 'package:lodgitech/features/guest_managment/presentation/widgets/guest_preferences_section.dart';
import 'package:lodgitech/features/guest_managment/presentation/widgets/guest_statistics_section.dart';
import 'package:lodgitech/features/guest_managment/presentation/widgets/personal_information.dart';

class GuestProfile extends StatelessWidget {
  final Guest guest;
  const GuestProfile({super.key, required this.guest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(child: PersonalInformation(guest: guest)),
                  Expanded(child: ContactAndStatus(guest: guest)),
                ],
              ),
            ),
            GuestStatisticsSection(guest: guest),
            GuestPreferencesSection(),
            CurrentStayInformation(
              roomNo: guest.roomNo.toString(),
              checkIn: DateTime.now(),
              checkOut: DateTime.now(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  context.pushAndReplacement(
                    AppRoutes.newGuest,
                    arguments: guest,
                  );
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
                  "Edit Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
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
