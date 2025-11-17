import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/features/dashboard/data/models/custom_drawer_item_model.dart';
import 'package:lodgitech/features/dashboard/domain/repositries/drawer_repositry.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerReposityImp implements DrawerRepositry {
  final SharedPreferences _preferences;

  DrawerReposityImp(this._preferences);
  @override
  int getCurrentDrawerIndex() {
    return _preferences.getInt("current_drawer_index") ?? 0;
  }

  @override
  List<CustomDrawerItemModel> getDrawerItems() {
    return [
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
      CustomDrawerItemModel(name: "Billing", icon: FontAwesomeIcons.moneyBill),
      CustomDrawerItemModel(
        name: "Suppliers",
        icon: FontAwesomeIcons.truckField,
      ),
      CustomDrawerItemModel(name: "Reports", icon: FontAwesomeIcons.scroll),
    ];
  }

  @override
  void setCurrentDrawerIndex(int index) {
    _preferences.setInt("current_drawer_index", index);
  }
}
