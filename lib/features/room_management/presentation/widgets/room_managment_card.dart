import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/features/room_management/data/models/room_status.dart';
import 'package:lodgitech/features/room_management/presentation/widgets/details_button.dart';
import 'package:lodgitech/features/room_management/presentation/widgets/room_status_drop_down_menu.dart';

class RoomManagementCard extends StatelessWidget {
  final Room room;
  final bool showClientInfo; 

  const RoomManagementCard({
    super.key,
    required this.room,
    this.showClientInfo = true, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: room.cardBackgroundColor,
        border: Border.all(width: 0.2, color: room.statusColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Room ${room.roomNumber}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: ShapeDecoration(
                  color: room.statusColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  room.statusText.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Text(room.roomType, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(FontAwesomeIcons.building, size: 16),
              const SizedBox(width: 8),
              Text("Floor ${room.floor}"),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(FontAwesomeIcons.usersLine, size: 16),
              const SizedBox(width: 8),
              Text("Up to ${room.maxGuests} guests"),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                "\$${room.pricePerNight}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 4),
              const Text("per night"),
            ],
          ),
          const SizedBox(height: 12),

          // Conditionally show client info based on showClientInfo and room.hasClient
          if (showClientInfo && room.hasClient) ...[
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    room.client!.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${_formatDate(room.client!.checkIn)} to ${_formatDate(room.client!.checkOut)}",
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],

          Wrap(
            spacing: 4,
            children: room.amenities.map((amenity) {
              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: FittedBox(child: _getAmenityIcon(amenity)),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const DetailsButton(),
              const SizedBox(width: 8),
              RoomStatusDropDownMenu(
                statusList: [
                  'Available',
                  'Occupied',
                  'Cleaning',
                  'Maintenance',
                ],
                width: 125,
                leadingIcon: Icon(FontAwesomeIcons.gear, size: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }

  Widget _getAmenityIcon(Amenity amenity) {
    switch (amenity) {
      case Amenity.wifi:
        return const Icon(FontAwesomeIcons.wifi, size: 14);
      case Amenity.tv:
        return const Icon(FontAwesomeIcons.tv, size: 14);
      case Amenity.ac:
        return const Icon(FontAwesomeIcons.wind, size: 14);
      case Amenity.kitchen:
        return const Icon(FontAwesomeIcons.kitchenSet, size: 14);
      case Amenity.parking:
        return const Icon(FontAwesomeIcons.car, size: 14);
      case Amenity.pool:
        return const Icon(FontAwesomeIcons.personSwimming, size: 14);
    }
  }
}
