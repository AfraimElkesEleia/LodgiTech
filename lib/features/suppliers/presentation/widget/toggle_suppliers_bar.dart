import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/font_weight_helper.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';

class ToggleSuppliersBar extends StatefulWidget {
  final void Function(int index) onTabChange;
  const ToggleSuppliersBar({super.key, required this.onTabChange});

  @override
  State<ToggleSuppliersBar> createState() => _ToggleSuppliersBarState();
}

class _ToggleSuppliersBarState extends State<ToggleSuppliersBar> {
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                padding: const EdgeInsets.all(4),
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(32),
                  constraints: BoxConstraints(
                    minWidth: constraints.maxWidth / 3.1,
                    minHeight: 48,
                  ),

                  isSelected: isSelected,
                  selectedColor: Colors.white,
                  fillColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  renderBorder: false,

                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = (i == index);
                      }
                    });
                    widget.onTabChange(index);
                    print("Selected tab = $index");
                  },

                  children: [
                    _buildToggleItem(
                      context,
                      "Suppliers",
                      0,
                      isSelected,
                      constraints.maxWidth / 3.1,
                    ),
                    _buildToggleItem(
                      context,
                      "Purchase Orders",
                      1,
                      isSelected,
                      constraints.maxWidth / 3.1,
                    ),
                    _buildToggleItem(
                      context,
                      "Analytics",
                      2,
                      isSelected,
                      constraints.maxWidth / 3.1,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildToggleItem(
    BuildContext context,
    String text,
    int index,
    List<bool> isSelected,
    double width,
  ) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: isSelected[index] ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(32),
        boxShadow: isSelected[index]
            ? [
                BoxShadow(
                  color: _getSelectedColor(index).withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Center(
        child: Text(
          text,
          style: AppStyles.light12Black(context).copyWith(
            fontWeight: isSelected[index]
                ? FontWeightHelper.bold
                : FontWeightHelper.medium,
          ),
        ),
      ),
    );
  }

  Color _getSelectedColor(int index) {
    switch (index) {
      case 0:
        return Colors.blue.shade600;
      case 1:
        return Colors.green.shade600;
      case 2:
        return Colors.purple.shade600;
      default:
        return Colors.blue.shade600;
    }
  }
}
