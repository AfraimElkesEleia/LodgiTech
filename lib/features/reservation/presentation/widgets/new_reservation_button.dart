import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/core/constants/app_routes.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/routing/navigation.dart';

class NewReservationButton extends StatelessWidget {
  final void Function() onPressed;
  const NewReservationButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
        padding: EdgeInsets.all(16),
      ),
      onPressed:onPressed,
      child: Row(
        children: [
          Icon(FontAwesomeIcons.plus, color: Colors.white),
          horizontalSpace(8),
          Text("New Reservation", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
