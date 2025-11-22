enum IDType { passport, drivingLicense, nationalID, other }

class Guest {
  final String id;
  final IDType idType;
  final String name;
  final String email;
  final String contact;
  final String status;
  final String currentStatus;
  final String? roomNo;
  final String? room;
  final String loyaltyTier;
  final int totalStays;
  final double totalSpent;
  final DateTime dateOfBirth;
  final String nationality;
  final String address;
  final String preference;
  final DateTime? checkIn;
  final DateTime? checkOut;

  Guest({
    required this.id,
    required this.idType, // <-- new
    required this.name,
    required this.contact,
    required this.status,
    required this.currentStatus,
    required this.email,
    this.roomNo,
    this.room,
    required this.loyaltyTier,
    required this.totalStays,
    required this.totalSpent,
    required this.dateOfBirth,
    required this.nationality,
    required this.address,
    required this.preference,
    this.checkIn,
    this.checkOut,
  });
}
