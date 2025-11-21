import 'package:flutter/material.dart';

class HeaderOfScreen extends StatelessWidget {
  final String titleOfScreen;
  const HeaderOfScreen({super.key, required this.titleOfScreen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleOfScreen,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(text: "Welcome back, "),
                TextSpan(
                  text: "Hotel Administrator",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
