import 'package:get_it/get_it.dart';
import 'package:mvce/controller/services/user_details_services.dart';

import 'controller/navigation/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UsersDetailsService());
}
