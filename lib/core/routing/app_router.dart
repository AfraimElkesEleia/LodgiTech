import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lodgitech/core/constants/app_routes.dart';
import 'package:lodgitech/core/di/sl.dart';
import 'package:lodgitech/features/dashboard/domain/repositries/drawer_repositry.dart';
import 'package:lodgitech/features/dashboard/presentation/cubit/drawer_cubit.dart';
import 'package:lodgitech/features/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:lodgitech/features/reservation/presentation/screens/new_reservation.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.dashboard:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                DrawerCubit(sl<DrawerRepositry>())..loadInitialData(),
            child: DashboardScreen(),
          ),
        );
      case AppRoutes.newReservation:
        return MaterialPageRoute(builder: (_) => NewReservation());
    }
  }
}
