import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';

class TitleWithActionButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onPressed;
  final IconData? buttonIcon;

  const TitleWithActionButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
    this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    bool isMobileLayout = width < 800;
    return isMobileLayout
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getTitleOfSection(context),
              verticalSpace(10),
              getButtonOfSection(context),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [getTitleOfSection(context), getButtonOfSection(context)],
          );
  }

  ElevatedButton getButtonOfSection(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (buttonIcon != null) Icon(buttonIcon, color: Colors.white),
          if (buttonIcon != null) horizontalSpace(8),
          Text(
            buttonText,
            style: AppStyles.light12Black(
              context,
            ).copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Column getTitleOfSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.semiBold14Black(context)),
        Text(subtitle, style: AppStyles.extraLight14Grey(context)),
      ],
    );
  }
}
