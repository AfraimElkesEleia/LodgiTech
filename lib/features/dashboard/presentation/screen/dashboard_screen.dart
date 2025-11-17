import 'package:flutter/material.dart';
import 'package:lodgitech/core/widgets/adapitive_layout.dart';
import 'package:lodgitech/features/dashboard/presentation/screen/dashboard_desktop_layout.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdapitiveLayout(
      mobileScreen: (c)=>Placeholder(),
      tabletScreen: (c)=>Placeholder(),
      desktopScreen:(c)=> DashboardDesktopLayout(),
    );
  }
}
