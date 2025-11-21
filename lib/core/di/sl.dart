import 'package:get_it/get_it.dart';
import 'package:lodgitech/features/dashboard/data/repositries/drawer_reposity_imp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lodgitech/features/dashboard/domain/repositries/drawer_repositry.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);

  // Repository
  sl.registerLazySingleton<DrawerRepositry>(
    () => DrawerReposityImp(sl()),
  );
}
