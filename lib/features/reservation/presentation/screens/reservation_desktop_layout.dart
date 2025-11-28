import 'package:flutter/material.dart';
import 'package:lodgitech/core/constants/app_routes.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/routing/navigation.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/core/widgets/custom_drop_down_menu.dart';
import 'package:lodgitech/core/widgets/custom_search_bar.dart';
import 'package:lodgitech/core/widgets/header_of_screen.dart';
import 'package:lodgitech/features/reservation/data/models/reservations.dart';
import 'package:lodgitech/features/reservation/presentation/widgets/new_reservation_button.dart';
import 'package:lodgitech/features/reservation/presentation/widgets/reservation_table.dart';

class ReservationDesktopLayout extends StatelessWidget {
  const ReservationDesktopLayout({super.key});
  static final reservations = [
    Reservation(
      id: "RES001",
      name: "John Smith",
      email: "john.smith@email.com",
      room: "Room 205",
      roomType: "Deluxe",
      from: DateTime(2024, 10, 5),
      to: DateTime(2024, 10, 8),
      nights: 2,
      status: "Confirmed",
      price: 450,
    ),
    Reservation(
      id: "RES002",
      name: "Sarah Johnson",
      email: "sarah.j@email.com",
      room: "Room 312",
      roomType: "Suite",
      from: DateTime(2024, 10, 6),
      to: DateTime(2024, 10, 10),
      nights: 4,
      status: "Pending",
      price: 800,
    ),
    Reservation(
      id: "RES003",
      name: "Mike Davis",
      email: "mike.davis@email.com",
      room: "Room 108",
      roomType: "Standard",
      from: DateTime(2024, 10, 4),
      to: DateTime(2024, 10, 6),
      nights: 1,
      status: "Checked In",
      price: 200,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HeaderOfScreen(titleOfScreen: "Reservation"),
          ),
          SliverToBoxAdapter(
            child: Builder(
              builder: (context) {
                final width = MediaQuery.of(context).size.width;

                if (width >= 1300) {
                  return Row(
                    children: [
                      CustomSearchBar(
                        hintText: "Search Reservations",
                        maxWidth: width / 3,
                      ),
                      SizedBox(width: 15),
                      StringDropDownMenu(
                        items: [
                          "All Status",
                          "Confirmed",
                          "Pending",
                          "Checked In",
                          "Checked Out",
                          "Cancelled",
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      NewReservationButton(
                        onPressed: () => pressOnNewReservationButton(context),
                      ),
                    ],
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomSearchBar(
                            hintText: "Search Reservations",
                            maxWidth: double.infinity,
                          ),
                        ),
                        SizedBox(width: 12),
                        StringDropDownMenu(
                          items: [
                            "All Status",
                            "Confirmed",
                            "Pending",
                            "Checked In",
                            "Checked Out",
                            "Cancelled",
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: NewReservationButton(
                        onPressed: () => pressOnNewReservationButton(context),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: CustomContainer(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reservations (3)",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  verticalSpace(8),
                  Text(
                    "Manage all hotels reservations and bookings",
                    style: TextStyle(color: Colors.grey),
                  ),
                  verticalSpace(8),
                  ReservationTable(
                    reservations: reservations,
                    onEdit: (reservation) {
                      print("Edit ${reservation.id}");
                      context.pushNamed(
                        AppRoutes.newReservation,
                        arguments: reservation,
                      );
                    },
                    onDelete: (reservation) {
                      print("Delete ${reservation.id}");
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

  Future<dynamic> pressOnNewReservationButton(BuildContext context) =>
      context.pushNamed(AppRoutes.newReservation);
}

class _HeaderCell extends StatelessWidget {
  final String text;

  const _HeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    );
  }
}
