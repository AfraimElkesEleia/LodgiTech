import 'package:flutter/material.dart';
import 'package:lodgitech/features/room_management/data/models/room_stats.dart';
import 'package:lodgitech/features/room_management/data/models/room_status.dart';
import 'package:lodgitech/features/room_management/presentation/widgets/room_managment_states.dart';
import 'package:lodgitech/features/room_management/presentation/widgets/rooms_grid_view.dart';
import 'package:lodgitech/features/room_management/presentation/widgets/searchbar_and_dropdown_menu_for_room_status_and_floor.dart';

class RoomManagmentDesktopLayout extends StatelessWidget {
  const RoomManagmentDesktopLayout({super.key});
  static List<RoomStats> roomStats = [
    RoomStats(number: 7, state: Stats.total),
    RoomStats(number: 3, state: Stats.available),
    RoomStats(number: 2, state: Stats.occupied),
    RoomStats(number: 1, state: Stats.cleaning),
    RoomStats(number: 1, state: Stats.maintenance),
  ];

  static List<Room> rooms = [
    Room(
      roomNumber: "101",
      roomType: "Standard",
      floor: 1,
      maxGuests: 2,
      pricePerNight: 120,
      status: RoomStatus.available,
      amenities: [Amenity.wifi, Amenity.tv],
      // No client - available room
    ),
    Room(
      roomNumber: "205",
      roomType: "Deluxe",
      floor: 2,
      maxGuests: 3,
      pricePerNight: 200,
      status: RoomStatus.occupied,
      amenities: [Amenity.wifi, Amenity.tv, Amenity.ac, Amenity.parking],
      client: Client(
        name: "John Smith",
        email: "john.smith@email.com",
        phone: "+1234567890",
        checkIn: DateTime(2024, 1, 15),
        checkOut: DateTime(2024, 1, 20),
      ),
    ),
    Room(
      roomNumber: "312",
      roomType: "Suite",
      floor: 3,
      maxGuests: 4,
      pricePerNight: 350,
      status: RoomStatus.maintenance,
      amenities: [Amenity.wifi, Amenity.tv, Amenity.ac, Amenity.kitchen],
      // No client - under maintenance
    ),
    Room(
      roomNumber: "408",
      roomType: "Executive Suite",
      floor: 4,
      maxGuests: 2,
      pricePerNight: 450,
      status: RoomStatus.cleaning,
      amenities: [
        Amenity.wifi,
        Amenity.tv,
        Amenity.ac,
        Amenity.parking,
        Amenity.kitchen,
      ],
      // No client - being cleaned
    ),
    Room(
      roomNumber: "5",
      roomType: "Premium Suite",
      floor: 4,
      maxGuests: 3,
      pricePerNight: 500,
      status: RoomStatus.available,
      amenities: [
        Amenity.ac,
        Amenity.pool,
        Amenity.wifi,
        Amenity.tv,
        Amenity.kitchen,
      ],
      // No client - available
    ),
    Room(
      roomNumber: "601",
      roomType: "Presidential Suite",
      floor: 6,
      maxGuests: 4,
      pricePerNight: 800,
      status: RoomStatus.occupied,
      amenities: [
        Amenity.wifi,
        Amenity.tv,
        Amenity.ac,
        Amenity.pool,
        Amenity.parking,
        Amenity.kitchen,
      ],
      client: Client(
        name: "Sarah Johnson",
        email: "sarah.j@email.com",
        phone: "+1987654321",
        checkIn: DateTime(2024, 1, 14),
        checkOut: DateTime(2024, 1, 18),
      ),
    ),
    Room(
      roomNumber: "702",
      roomType: "Family Room",
      floor: 7,
      maxGuests: 5,
      pricePerNight: 300,
      status: RoomStatus.available,
      amenities: [Amenity.wifi, Amenity.tv, Amenity.ac, Amenity.pool],
      client: Client(
        name: "Michael Brown",
        email: "m.brown@email.com",
        checkIn: DateTime(2024, 1, 25),
        checkOut: DateTime(2024, 1, 28),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              children: roomStats.map((room) {
                return Expanded(child: RoomManagmentStates(roomStats: room));
              }).toList(),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: SearchbarAndDropdownMenuForRoomStatusAndFloor(),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 14)),
          RoomsGridView(rooms: rooms),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}
