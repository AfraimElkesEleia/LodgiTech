import 'package:flutter/material.dart';
import 'package:lodgitech/core/constants/app_routes.dart';
import 'package:lodgitech/features/dashboard/presentation/screen/dashboard_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
    }
  }
}
