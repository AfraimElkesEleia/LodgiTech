import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/features/dashboard/data/models/custom_drawer_item_model.dart';
import 'package:lodgitech/features/dashboard/domain/repositries/drawer_repositry.dart';

class DrawerRepositoryImpl implements DrawerRepository {
  @override
  List<CustomDrawerItemModel> getDrawerItems() {
    return const [
      CustomDrawerItemModel(
        name: "Dashboard",
        icon: FontAwesomeIcons.chartArea,
      ),
      CustomDrawerItemModel(
        name: "Reservation",
        icon: FontAwesomeIcons.calendar,
      ),
      CustomDrawerItemModel(
        name: "Room Management",
        icon: FontAwesomeIcons.building,
      ),
      CustomDrawerItemModel(
        name: "Guest Management",
        icon: FontAwesomeIcons.users,
      ),
      CustomDrawerItemModel(
        name: "Billing",
        icon: FontAwesomeIcons.moneyBill,
      ),
      CustomDrawerItemModel(
        name: "Suppliers",
        icon: FontAwesomeIcons.truckField,
      ),
      CustomDrawerItemModel(
        name: "Reports",
        icon: FontAwesomeIcons.scroll,
      ),
    ];
  }
}
