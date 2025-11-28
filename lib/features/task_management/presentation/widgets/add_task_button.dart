import 'package:flutter/material.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';

class AddTaskButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final bool isLoading;
  final bool isDisabled;

  const AddTaskButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.isLoading = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width,
      height: 48,
      child: ElevatedButton(
        onPressed: (isDisabled || isLoading) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.primaryColor,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey[300],
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(text, style: AppStyles.semiBold10White(context)),
      ),
    );
  }
}
