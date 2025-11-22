class Guest {
  final String id;
  final String name;
  final String email;
  final String contact;
  final String status;
  final String? roomNo;
  final String loyaltyTier;
  final int totalStays;
  final double totalSpent;

  Guest({
    required this.id,
    required this.name,
    required this.contact,
    required this.status,
    required this.email,
    this.roomNo,
    required this.loyaltyTier,
    required this.totalStays,
    required this.totalSpent,
  });
}
