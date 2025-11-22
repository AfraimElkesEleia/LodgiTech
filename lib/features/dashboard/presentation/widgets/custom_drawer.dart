import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/features/dashboard/presentation/cubit/drawer_cubit.dart';
import 'package:lodgitech/features/dashboard/presentation/cubit/drawer_state.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/custom_drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, state) {
        return Drawer(
          backgroundColor: const Color(0xFFFAFAFA),
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                _buildLogoAndTitle(context),
                _buildDrawerItemList(context, state),
              ],
            ),
          ),
        );
      },
    );
  }

  SliverToBoxAdapter _buildLogoAndTitle(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        leading: Icon(FontAwesomeIcons.hotel, size: 40),
        title: Text("LodgiTech", style: AppStyles.semiBold24Black(context)),
        subtitle: Text("Management System"),
      ),
    );
  }

  SliverList _buildDrawerItemList(BuildContext context, DrawerState state) {
    return SliverList.builder(
      itemCount: state.drawerItems.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => context.read<DrawerCubit>().updateCurrentIndex(index),
          child: CustomDrawerItem(
            isActive: state.currentIndex == index,
            customDrawerItemModel: state.drawerItems[index],
          ),
        );
      },
    );
  }
}
