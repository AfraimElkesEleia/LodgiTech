import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/dashboard/data/models/custom_drawer_item_model.dart';
import 'package:lodgitech/features/dashboard/presentation/widgets/custom_drawer_item.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int currentIndex = 0;
  List<CustomDrawerItemModel> customDrawerItems = [
    CustomDrawerItemModel(name: "Dashboard", icon: FontAwesomeIcons.chartArea),
    CustomDrawerItemModel(name: "Reservation", icon: FontAwesomeIcons.calendar),
    CustomDrawerItemModel(
      name: "Room Managment",
      icon: FontAwesomeIcons.building,
    ),
    CustomDrawerItemModel(
      name: "Guest Managment",
      icon: FontAwesomeIcons.users,
    ),
    CustomDrawerItemModel(name: "Billing", icon: FontAwesomeIcons.moneyBill),
    CustomDrawerItemModel(name: "Suppliers", icon: FontAwesomeIcons.truckField),
    CustomDrawerItemModel(name: "Reports", icon: FontAwesomeIcons.scroll),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFFAFAFA),
      child: CustomScrollView(
        slivers: [
          buildLogoAndTitleOfCustomDrawer(),
          buildCustomDrawerItemList(),
          
        ],
      ),
    );
  }

  SliverToBoxAdapter buildLogoAndTitleOfCustomDrawer() {
    return SliverToBoxAdapter(
      child: ListTile(
        leading: Icon(FontAwesomeIcons.hotel, size: 40),
        title: Text(
          "LodgiTech",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        subtitle: Text("Managent System"),
      ),
    );
  }

  SliverList buildCustomDrawerItemList() {
    return SliverList.builder(
      itemCount: customDrawerItems.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => setState(() {
            currentIndex = index;
          }),
          child: CustomDrawerItem(
            isActive: currentIndex == index,
            customDrawerItemModel: customDrawerItems[index],
          ),
        );
      },
    );
  }
}
