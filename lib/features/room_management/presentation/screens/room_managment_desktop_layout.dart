import 'package:flutter/material.dart';

class RoomManagmentDesktopLayout extends StatelessWidget {
  const RoomManagmentDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Row(children: [Text("Afraim")])),
        ],
      ),
    );
  }
}
