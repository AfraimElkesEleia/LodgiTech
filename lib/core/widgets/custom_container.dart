import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  const CustomContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(18),
      margin: margin ?? EdgeInsets.all(8),
      width: width,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
          side: BorderSide(width: 0.6, color: Colors.grey),
        ),
      ),
      child: child,
    );
  }
}
