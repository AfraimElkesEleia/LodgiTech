import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/widgets/custom_drop_down_menu.dart';
import 'package:lodgitech/core/widgets/custom_search_bar.dart';

class BillingSearchBarAndDropDownMenu extends StatelessWidget {
  const BillingSearchBarAndDropDownMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          CustomSearchBar(maxWidth: MediaQuery.sizeOf(context).width / 3),
          horizontalSpace(8),
          StringDropDownMenu(items: ["All Status", "Paid", "Pending"]),
        ],
      ),
    );
  }
}