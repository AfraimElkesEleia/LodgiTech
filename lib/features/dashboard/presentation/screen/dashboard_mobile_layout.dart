import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lodgitech/features/billing/presentation/screens/billing_desktop_layout.dart';
import 'package:lodgitech/features/dashboard/presentation/cubit/drawer_cubit.dart';
import 'package:lodgitech/features/dashboard/presentation/cubit/drawer_state.dart';
import 'package:lodgitech/features/dashboard/presentation/screen/dashboard_mobile_layout_content.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/custom_drawer.dart';
import 'package:lodgitech/features/guest_managment/presentation/screens/guest_management_desktop.dart';
import 'package:lodgitech/features/reservation/presentation/screens/reservation_desktop_layout.dart';
import 'package:lodgitech/features/room_management/presentation/screens/room_managemnet_mobile_layout.dart';
import 'package:lodgitech/features/suppliers/presentation/screen/suppliers_desktop_layout.dart';
import 'package:lodgitech/features/task_management/presentation/screens/task_management_desktop_layout.dart';

class DashboardMobileLayout extends StatelessWidget {
  DashboardMobileLayout({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static final List<Widget> screens = [
    DashboardMobileLayoutContent(),
    ReservationDesktopLayout(),
    RoomManagementMobileLayout(),
    GuestManagementDesktop(),
    BillingDesktopLayout(),
    SuppliersDesktopLayout(),
    TasksDesktopLayout(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      drawer: const CustomDrawer(),

      appBar: AppBar(
        title: const Text("LodgiTech"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
      ),

      body: BlocBuilder<DrawerCubit, DrawerState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: screens[state.currentIndex],
          );
        },
      ),
    );
  }
}
