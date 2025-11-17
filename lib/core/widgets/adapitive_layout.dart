import 'package:flutter/material.dart';

class AdapitiveLayout extends StatelessWidget {
  final WidgetBuilder mobileScreen, tabletScreen, desktopScreen;
  const AdapitiveLayout({
    super.key,
    required this.mobileScreen,
    required this.tabletScreen,
    required this.desktopScreen,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return mobileScreen(context);
        } else if (constraints.maxWidth < 1300) {
          return tabletScreen(context);
        } else {
          return desktopScreen(context);
        }
      },
    );
  }
}
