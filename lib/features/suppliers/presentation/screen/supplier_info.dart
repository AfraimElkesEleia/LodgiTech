import 'package:flutter/material.dart';
import 'package:lodgitech/core/constants/app_routes.dart';
import 'package:lodgitech/core/routing/navigation.dart';
import 'package:lodgitech/features/suppliers/data/supplier_model.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/supplier_contact_info.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/supplier_profile_service_section.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/suppliers_profile_statistics_section.dart';

class SupplierProfile extends StatelessWidget {
  final SupplierModel supplier;

  const SupplierProfile({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SupplierContactInfo(supplier: supplier),

            SuppliersProfileStatisticsSection(supplier: supplier),

            SupplierProfileServiceSection(services: supplier.services),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () {
                  context.pushAndReplacement(
                    AppRoutes.newSupplier,
                    arguments: supplier,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                  minimumSize: const Size(double.infinity, 25),
                ),
                child: const Text(
                  "Edit Supplier",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
