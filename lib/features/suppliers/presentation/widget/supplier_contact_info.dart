import 'package:flutter/material.dart';
import 'package:lodgitech/features/suppliers/data/supplier_model.dart';

class SupplierContactInfo extends StatelessWidget {
  final SupplierModel supplier;

  const SupplierContactInfo({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Contact Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _infoTile("Supplier", supplier.name),
            _infoTile("Contact Person", supplier.contactPerson),
            _infoTile("Email", supplier.email),
            _infoTile("Phone", supplier.phone),
            _infoTile("Address", supplier.address),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
