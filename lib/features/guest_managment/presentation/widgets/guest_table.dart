import 'package:flutter/material.dart';
import 'package:lodgitech/features/guest_managment/data/models/guest.dart';

class GuestTable extends StatelessWidget {
  final List<Guest> guests;
  final void Function(Guest) onOpenProfile;

  const GuestTable({
    super.key,
    required this.guests,
    required this.onOpenProfile,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingTextStyle: const TextStyle(fontWeight: FontWeight.w600),
        columns: const [
          DataColumn(label: Text("Guest ID")),
          DataColumn(label: Text("Name")),
          DataColumn(label: Text("Contact")),
          DataColumn(label: Text("Current Status")),
          DataColumn(label: Text("Loyalty Tier")),
          DataColumn(label: Text("Total Stays")),
          DataColumn(label: Text("Total Spent")),
          DataColumn(label: Text("Action")),
        ],
        rows: guests.map((g) => _buildRow(g)).toList(),
      ),
    );
  }

  DataRow _buildRow(Guest g) {
    return DataRow(
      cells: [
        DataCell(Text(g.id)),

        DataCell(_twoLines(title: g.name, subtitle: g.contact)),

        DataCell(Text(g.contact)),

        DataCell(
          _statusChip(
            g.status,
            subtitle:
                (g.status.toLowerCase() != "checked out" && g.roomNo != null)
                ? "Room ${g.roomNo}"
                : null,
          ),
        ),

        DataCell(_loyaltyChip(g.loyaltyTier)),

        DataCell(Text(g.totalStays.toString())),

        DataCell(Text("\$${g.totalSpent.toStringAsFixed(2)}")),

        DataCell(
          ElevatedButton(
            onPressed: () => onOpenProfile(g),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              backgroundColor: Colors.black,
            ),
            child: const Text(
              "View Profile",
              style: TextStyle(color: Colors.white),
            ),
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

  Widget _statusChip(String status, {String? subtitle}) {
    Color color;

    switch (status.toLowerCase()) {
      case "reserved":
        color = Colors.orange;
        break;
      case "checked in":
        color = Colors.green;
        break;
      case "checked out":
        color = Colors.grey;
        break;
      default:
        color = Colors.blueGrey;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
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
        ),
        if (subtitle != null)
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
      ],
    );
  }

  Widget _loyaltyChip(String tier) {
    Color color;

    switch (tier.toLowerCase()) {
      case "gold":
        color = Colors.amber.shade700;
        break;
      case "silver":
        color = Colors.blueGrey;
        break;
      case "platinum":
        color = Colors.blue;
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
        tier,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
