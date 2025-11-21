
class Reservation {
  final String id;
  final String name;
  final String email;
  final String room;
  final String roomType;
  final DateTime from;
  final DateTime to;
  final int nights;
  final String status;
  final double price;

  Reservation({
    required this.id,
    required this.name,
    required this.email,
    required this.room,
    required this.roomType,
    required this.from,
    required this.to,
    required this.nights,
    required this.status,
    required this.price,
  });
}
