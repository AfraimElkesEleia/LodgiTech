import 'package:flutter/material.dart';

class Client {
  final String name;
  final String? email;
  final String? phone;
  final DateTime checkIn;
  final DateTime checkOut;

  const Client({
    required this.name,
    this.email,
    this.phone,
    required this.checkIn,
    required this.checkOut,
  });

  int get stayDuration => checkOut.difference(checkIn).inDays;
}

class Room {
  final String roomNumber;
  final String roomType;
  final int floor;
  final int maxGuests;
  final double pricePerNight;
  final RoomStatus status;
  final List<Amenity> amenities;
  final Client? client;

  const Room({
    required this.roomNumber,
    required this.roomType,
    required this.floor,
    required this.maxGuests,
    required this.pricePerNight,
    required this.status,
    required this.amenities,
    this.client, // Optional client
  });

  // Helper method to check if room has a client
  bool get hasClient => client != null;

  // Helper method to get current guest count (0 if no client)
  int get currentGuests =>
      hasClient ? 1 : 0; // You can modify this logic based on your needs

  Color get statusColor {
    switch (status) {
      case RoomStatus.available:
        return Colors.green;
      case RoomStatus.maintenance:
        return Colors.red;
      case RoomStatus.occupied:
        return Colors.orange;
      case RoomStatus.cleaning:
        return Colors.blue;
      case RoomStatus.reserved:
        return Colors.purple;
    }
  }

  Color get cardBackgroundColor {
    switch (status) {
      case RoomStatus.available:
        return const Color(0xFFF0F9FF);
      case RoomStatus.maintenance:
        return const Color(0xFFFEF2F2);
      case RoomStatus.occupied:
        return const Color(0xFFFFF7ED);
      case RoomStatus.cleaning:
        return const Color(0xFFF0FDF4);
      case RoomStatus.reserved:
        return const Color(0xFFF3E8FF);
    }
  }

  // Helper method to get status display text
  String get statusText {
    switch (status) {
      case RoomStatus.available:
        return "Available";
      case RoomStatus.maintenance:
        return "Maintenance";
      case RoomStatus.occupied:
        return "Occupied";
      case RoomStatus.cleaning:
        return "Cleaning";
      case RoomStatus.reserved:
        return "Reserved";
    }
  }
}

enum RoomStatus { available, maintenance, occupied, cleaning, reserved }

enum Amenity { wifi, tv, ac, kitchen, parking, pool }
