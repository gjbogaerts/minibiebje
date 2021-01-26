import 'package:get_it/get_it.dart';

import '../services/auth_service_b4a.dart';
import '../services/db_service_graphql.dart';
import '../services/auth_service_abstract.dart';
import '../services/db_service_abstract.dart';
import 'package:stacked_services/stacked_services.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<AuthServiceAbstract>(() => AuthServiceB4a());
  locator.registerLazySingleton<DbServiceAbstract>(() => DbServiceGraphQL());
  locator.registerLazySingleton(() => DialogService());
}
