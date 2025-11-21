import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final double maxWidth;
  final double minHeight;
  final IconData leadingIcon;
  final Color backgroundColor;
  final double borderRadius;
  final double elevation;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  const CustomSearchBar({
    super.key,
    this.hintText = "Search...",
    this.maxWidth = 500,
    this.minHeight = 48,
    this.leadingIcon = FontAwesomeIcons.magnifyingGlass,
    this.backgroundColor = const Color(0xFFF3F3F5),
    this.borderRadius = 12,
    this.elevation = 0,
    this.controller,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      hintText: hintText,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      backgroundColor: WidgetStatePropertyAll(backgroundColor),
      elevation: WidgetStatePropertyAll(elevation),
      constraints: BoxConstraints(maxWidth: maxWidth, minHeight: minHeight),
      leading: Icon(leadingIcon, color: Colors.grey),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
