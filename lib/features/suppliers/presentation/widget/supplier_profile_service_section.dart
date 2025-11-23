import 'package:flutter/material.dart';

class SupplierProfileServiceSection extends StatelessWidget {
  final List<String> services;

  const SupplierProfileServiceSection({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Products & Services",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: services
                  .map((s) => Chip(
                        label: Text(s),
                        backgroundColor: Colors.blue.shade50,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
