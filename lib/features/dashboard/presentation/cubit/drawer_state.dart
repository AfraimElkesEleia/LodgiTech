import 'package:lodgitech/features/dashboard/data/models/custom_drawer_item_model.dart';

class DrawerState {
  final int currentIndex;
  final List<CustomDrawerItemModel> drawerItems;
  const DrawerState({required this.currentIndex, required this.drawerItems});
  factory DrawerState.initial() {
    return DrawerState(currentIndex: 0, drawerItems: []);
  }
  DrawerState copyWith({
    int? currentIndex,
    List<CustomDrawerItemModel>? drawerItems,
  }) {
    return DrawerState(
      currentIndex: currentIndex ?? this.currentIndex,
      drawerItems: drawerItems ?? this.drawerItems,
    );
  }
}
