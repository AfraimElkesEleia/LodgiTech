import 'package:lodgitech/features/dashboard/data/models/custom_drawer_item_model.dart';

abstract class DrawerRepositry {
  int getCurrentDrawerIndex();
  void setCurrentDrawerIndex(int index);
  List<CustomDrawerItemModel> getDrawerItems();
}
