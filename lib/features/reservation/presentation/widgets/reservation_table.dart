import 'package:flutter/material.dart';
import 'package:lodgitech/features/reservation/data/models/reservations.dart';

class ReservationTable extends StatelessWidget {
  final List<Reservation> reservations;
  final void Function(Reservation) onEdit;
  final void Function(Reservation) onDelete;

  const ReservationTable({
    super.key,
    required this.reservations,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingTextStyle: const TextStyle(fontWeight: FontWeight.w600),
        columns: const [
          DataColumn(label: Text("Reservation ID")),
          DataColumn(label: Text("Guest")),
          DataColumn(label: Text("Room")),
          DataColumn(label: Text("Dates")),
          DataColumn(label: Text("Guests")),
          DataColumn(label: Text("Status")),
          DataColumn(label: Text("Amount")),
          DataColumn(label: Text("Actions")),
        ],
        rows: reservations.map((r) => _buildDataRow(r)).toList(),
      ),
    );
  }

  DataRow _buildDataRow(Reservation r) {
    return DataRow(
      cells: [
        DataCell(Text(r.id)),

        DataCell(_twoLines(title: r.name, subtitle: r.email)),

        DataCell(_twoLines(title: r.room, subtitle: r.roomType)),

        DataCell(
          _twoLines(title: _formatDate(r.from), subtitle: _formatDate(r.to)),
        ),

        DataCell(Text(r.nights.toString())),

        DataCell(_statusChip(r.status)),

        DataCell(Text("\$${r.price}")),

        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () => onEdit(r),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => onDelete(r),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _twoLines({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        Text(subtitle, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _statusChip(String status) {
    Color color;

    switch (status.toLowerCase()) {
      case "confirmed":
        color = Colors.green;
        break;
      case "pending":
        color = Colors.orange;
        break;
      case "checked in":
        color = Colors.blue;
        break;
      case "checked out":
        color = Colors.grey;
        break;
      case "cancelled":
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(
        status,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.month}/${date.day}/${date.year}";
  }
}
