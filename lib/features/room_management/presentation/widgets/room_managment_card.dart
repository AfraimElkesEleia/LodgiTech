import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
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
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 4),
          Text(room.roomType, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 12),

          _buildInfoRow(FontAwesomeIcons.building, "Floor ${room.floor}"),
          const SizedBox(height: 8),
          _buildInfoRow(
            FontAwesomeIcons.usersLine,
            "Up to ${room.maxGuests} guests",
          ),
          const SizedBox(height: 8),
          _buildPrice(),
          const SizedBox(height: 12),

          if (showClientInfo && room.hasClient) _buildClientInfo(context),
          if (showClientInfo && room.hasClient) const SizedBox(height: 12),

          _buildAmenitiesWrap(),
          const Expanded(child: SizedBox()),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Room ${room.roomNumber}",
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: room.statusColor,
            borderRadius: BorderRadius.circular(12),
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
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [Icon(icon, size: 16), const SizedBox(width: 8), Text(text)],
    );
  }

  Widget _buildPrice() {
    return Row(
      children: [
        Text(
          "\$${room.pricePerNight}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 4),
        const Text("per night"),
      ],
    );
  }

  Widget _buildClientInfo(BuildContext context) {
    final client = room.client!;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            client.name,
            style: AppStyles.semiBold14Black(context).copyWith(fontSize: 13),
          ),
          Text(
            "${_formatDate(client.checkIn)} to ${_formatDate(client.checkOut)}",
            style: AppStyles.normal16Grey(context).copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildAmenitiesWrap() {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
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
          child: _getAmenityIcon(amenity),
        );
      }).toList(),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      children: [
        const DetailsButton(),
        const SizedBox(width: 8),
        Expanded(
          child: RoomStatusDropDownMenu(
            statusList: const [
              'Available',
              'Occupied',
              'Cleaning',
              'Maintenance',
            ],
            width: double.infinity,
            leadingIcon: const Icon(FontAwesomeIcons.gear, size: 14),
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) => '${date.month}/${date.day}/${date.year}';

  Widget _getAmenityIcon(Amenity amenity) {
    switch (amenity) {
      case Amenity.wifi:
        return const Icon(FontAwesomeIcons.wifi, size: 12);
      case Amenity.tv:
        return const Icon(FontAwesomeIcons.tv, size: 12);
      case Amenity.ac:
        return const Icon(FontAwesomeIcons.wind, size: 12);
      case Amenity.kitchen:
        return const Icon(FontAwesomeIcons.kitchenSet, size: 12);
      case Amenity.parking:
        return const Icon(FontAwesomeIcons.car, size: 12);
      case Amenity.pool:
        return const Icon(FontAwesomeIcons.personSwimming, size: 12);
    }
  }
}
