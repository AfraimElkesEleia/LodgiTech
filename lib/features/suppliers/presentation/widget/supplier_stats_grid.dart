import 'package:flutter/material.dart';
import 'package:lodgitech/features/suppliers/data/supplier_stats.dart';
import 'package:lodgitech/features/suppliers/presentation/widget/supplier_stats_card.dart';

class SupplierStatsGrid extends StatelessWidget {
  final List<SupplierStats> stats;
  final int crossAxisCount;
  final double aspectRatio;

  const SupplierStatsGrid({
    super.key,
    required this.stats,
    this.crossAxisCount = 3,
    this.aspectRatio = 2 / 1,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: aspectRatio,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: stats.length,
        (context, index) => SupplierStatsCard(stats: stats[index]),
      ),
    );
  }
}
