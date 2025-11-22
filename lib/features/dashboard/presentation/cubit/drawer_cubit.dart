import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lodgitech/features/dashboard/domain/repositries/drawer_repositry.dart';
import 'package:lodgitech/features/dashboard/presentation/cubit/drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  final DrawerRepository repository;

  DrawerCubit(this.repository) : super(DrawerState.initial()) {
    loadDrawerItems();
  }

  void loadDrawerItems() {
    final items = repository.getDrawerItems();
    emit(state.copyWith(drawerItems: items));
  }

  void updateCurrentIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
