import 'package:lodgitech/features/dashboard/data/models/custom_drawer_item_model.dart';

abstract class DrawerRepository {
  List<CustomDrawerItemModel> getDrawerItems();
}
