import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/auth_service_abstract.dart';
import '../services/auth_service_b4a.dart';
import '../services/db_service_abstract.dart';
import '../services/db_service_graphql.dart';
import '../services/google_books_service.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<AuthServiceAbstract>(() => AuthServiceB4a());
  locator.registerLazySingleton<DbServiceAbstract>(() => DbServiceGraphQL());
  locator.registerLazySingleton<DialogService>(() => DialogService());
  locator.registerLazySingleton<SnackbarService>(() => SnackbarService());
  locator.registerLazySingleton<GoogleBooksService>(() => GoogleBooksService());
}
