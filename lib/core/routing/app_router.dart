import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lodgitech/core/constants/app_routes.dart';
import 'package:lodgitech/core/di/sl.dart';
import 'package:lodgitech/features/dashboard/domain/repositries/drawer_repositry.dart';
import 'package:lodgitech/features/dashboard/presentation/cubit/drawer_cubit.dart';
import 'package:lodgitech/features/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:lodgitech/features/guest_managment/data/models/guest.dart';
import 'package:lodgitech/features/guest_managment/presentation/screens/add_new_guest.dart';
import 'package:lodgitech/features/guest_managment/presentation/screens/guest_profile.dart';
import 'package:lodgitech/features/reservation/presentation/screens/new_reservation.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.dashboard:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                DrawerCubit(sl<DrawerRepository>())..loadDrawerItems(),
            child: DashboardScreen(),
          ),
        );
      case AppRoutes.newReservation:
        return MaterialPageRoute(builder: (_) => NewReservation());
      case AppRoutes.newGuest:
        return MaterialPageRoute(builder: (_) => AddNewGuest());
      case AppRoutes.guestProfile:
        final guest = settings.arguments as Guest;
        return MaterialPageRoute(builder: (_) => GuestProfile(guest: guest));
    }
  }
}
