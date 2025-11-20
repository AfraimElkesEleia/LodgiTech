
import 'package:flutter/material.dart';

class DetailsButton extends StatelessWidget {
  const DetailsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        elevation: 0,
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: const Text(
        "Details",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
