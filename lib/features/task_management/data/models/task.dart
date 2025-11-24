class Task {
  final String id;
  final String employeeId;
  final String type;
  final String roomNumber;
  final String description;
  final DateTime createdAt;
  final bool isCompleted;

  Task({
    required this.id,
    required this.employeeId,
    required this.type,
    required this.roomNumber,
    required this.description,
    required this.createdAt,
    this.isCompleted = false,
  });

  Task copyWith({
    String? id,
    String? employeeId,
    String? type,
    String? roomNumber,
    String? description,
    DateTime? createdAt,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      type: type ?? this.type,
      roomNumber: roomNumber ?? this.roomNumber,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}