import 'package:get_it/get_it.dart';
import 'package:lodgitech/features/dashboard/data/repositries/drawer_reposity_imp.dart';
import 'package:lodgitech/features/dashboard/domain/repositries/drawer_repositry.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<DrawerRepository>(() => DrawerRepositoryImpl());
}
