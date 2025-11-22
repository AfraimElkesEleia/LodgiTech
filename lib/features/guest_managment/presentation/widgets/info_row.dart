import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const InfoRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$title: ",
              style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}