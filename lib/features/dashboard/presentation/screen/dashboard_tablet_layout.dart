import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lodgitech/features/dashboard/presentation/cubit/drawer_cubit.dart';
import 'package:lodgitech/features/dashboard/presentation/cubit/drawer_state.dart';
import 'package:lodgitech/features/dashboard/presentation/screen/dashboard_tablet_layout_content.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/custom_drawer.dart';

class DashboardTabletLayout extends StatelessWidget {
  const DashboardTabletLayout({super.key});
  static final List<Widget> screens = [
    DashboardTabletLayoutContent(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 1, child: CustomDrawer()),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: BlocBuilder<DrawerCubit, DrawerState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: screens[state.currentIndex],
              );
            },
          ),
        ),
      ],
    );
  }
}
