import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/core/constants/app_routes.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/routing/navigation.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/core/widgets/custom_drop_down_menu.dart';
import 'package:lodgitech/core/widgets/custom_search_bar.dart';
import 'package:lodgitech/core/widgets/header_of_screen.dart';
import 'package:lodgitech/features/guest_managment/data/models/guest.dart';
import 'package:lodgitech/features/guest_managment/presentation/widgets/guest_table.dart';

class GuestManagementDesktop extends StatelessWidget {
  const GuestManagementDesktop({super.key});
  static final List<Guest> guests = [
    Guest(
      id: "G001",
      name: "John Doe",
      email: "john@example.com",
      contact: "+1 202-555-0148",
      status: "Checked In",
      currentStatus: "In Room",
      roomNo: "204",
      room: "204",
      loyaltyTier: "Gold",
      totalStays: 12,
      totalSpent: 2540.75,
      dateOfBirth: DateTime(1988, 4, 15),
      nationality: "USA",
      address: "123 Main Street, New York",
      preference: "Non-smoking, High Floor",
      idType: IDType.drivingLicense,
    ),
    Guest(
      id: "G002",
      name: "Sarah Miller",
      email: "sarah.miller@example.com",
      contact: "+1 202-555-0199",
      status: "Reserved",
      currentStatus: "Waiting for Check-in",
      roomNo: "110",
      room: null,
      loyaltyTier: "Silver",
      totalStays: 5,
      totalSpent: 920.50,
      dateOfBirth: DateTime(1992, 7, 22),
      nationality: "USA",
      address: "456 Park Ave, New York",
      preference: "King Bed, Balcony",
      idType: IDType.nationalID,
    ),
    Guest(
      id: "G003",
      name: "Michael Brown",
      email: "michael.b@example.com",
      contact: "+44 7700 900123",
      status: "Checked Out",
      currentStatus: "Left Hotel",
      roomNo: null,
      room: null,
      loyaltyTier: "Platinum",
      totalStays: 22,
      totalSpent: 5430.00,
      dateOfBirth: DateTime(1985, 1, 10),
      nationality: "UK",
      address: "12 London Road, London",
      preference: "Suite, Ocean View",
      idType: IDType.passport,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HeaderOfScreen(titleOfScreen: "Guest Management"),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                CustomSearchBar(maxWidth: MediaQuery.sizeOf(context).width / 3),
                horizontalSpace(12),
                StringDropDownMenu(
                  items: [
                    'All Status',
                    'Checked In',
                    'Reservation',
                    'Check Out',
                  ],
                ),
                Expanded(child: SizedBox()),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                    padding: EdgeInsets.all(16),
                  ),
                  onPressed: () {
                    context.pushNamed(AppRoutes.newGuest);
                  },
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.plus, color: Colors.white),
                      horizontalSpace(8),
                      Text("Add Guest", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: CustomContainer(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Guest Directory (${guests.length})",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  verticalSpace(8),
                  Text(
                    "Manage guest profile and information",
                    style: TextStyle(color: Colors.grey),
                  ),
                  verticalSpace(8),
                  GuestTable(
                    guests: guests,
                    onOpenProfile: (guest) {
                      context.pushNamed(
                        AppRoutes.guestProfile,
                        arguments: guest,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
