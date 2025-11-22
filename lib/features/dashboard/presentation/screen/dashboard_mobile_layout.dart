import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lodgitech/features/dashboard/presentation/cubit/drawer_cubit.dart';
import 'package:lodgitech/features/dashboard/presentation/cubit/drawer_state.dart';
import 'package:lodgitech/features/dashboard/presentation/screen/dashboard_mobile_layout_content.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/custom_drawer.dart';

class DashboardMobileLayout extends StatelessWidget {
  DashboardMobileLayout({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static final List<Widget> screens = [
    DashboardMobileLayoutContent(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
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
          return screens[state.currentIndex];
        },
      ),
    );
  }
}
