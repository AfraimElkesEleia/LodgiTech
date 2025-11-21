import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lodgitech/features/dashboard/presentation/cubit/drawer_cubit.dart';
import 'package:lodgitech/features/dashboard/presentation/cubit/drawer_state.dart';
import 'package:lodgitech/features/dashboard/presentation/screen/dashboard_desktop_layout_content.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/custom_drawer.dart';
import 'package:lodgitech/features/room_management/presentation/screens/room_managment_desktop_layout.dart';

class DashboardDesktopLayout extends StatelessWidget {
  const DashboardDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      DashboardDesktopLayoutContent(),
      Placeholder(),
      RoomManagmentDesktopLayout(),
      Placeholder(),
      Placeholder(),
      Placeholder(),
      Placeholder(),
    ];

    return Scaffold(
      body: Row(
        children: [
          const Expanded(flex: 1, child: CustomDrawer()),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: BlocBuilder<DrawerCubit, DrawerState>(
              builder: (context, state) {
                print(state.currentIndex);
                return screens[state.currentIndex];
              },
            ),
          ),
        ],
      ),
    );
  }
}
