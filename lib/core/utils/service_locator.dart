import 'package:get_it/get_it.dart';

import '../services/auth_service_b4a.dart';
import '../services/db_service_graphql.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<AuthServiceB4a>(() => AuthServiceB4a());
  locator.registerLazySingleton<DbServiceGraphQL>(() => DbServiceGraphQL());
}
