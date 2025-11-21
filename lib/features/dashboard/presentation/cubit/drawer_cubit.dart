import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lodgitech/features/dashboard/data/models/custom_drawer_item_model.dart';
import 'package:lodgitech/features/dashboard/domain/repositries/drawer_repositry.dart';
import 'package:lodgitech/features/dashboard/presentation/cubit/drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  final DrawerRepositry _drawerRepository;

  DrawerCubit(this._drawerRepository) : super(DrawerState.initial());

  void loadInitialData() {
    final int currentIndex = _drawerRepository.getCurrentDrawerIndex();
    final List<CustomDrawerItemModel> listItems = _drawerRepository
        .getDrawerItems();
    emit(state.copyWith(drawerItems: listItems, currentIndex: currentIndex));
  }

  void updateCurrentIndex(int index) {
    _drawerRepository.setCurrentDrawerIndex(index);
    emit(state.copyWith(currentIndex: index));
  }
}
