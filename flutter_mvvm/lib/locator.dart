import 'package:get_it/get_it.dart';

import 'package:flutter_mvvm/core/services/todos_service.dart';
import 'package:flutter_mvvm/core/services/navigation_service.dart';
import 'package:flutter_mvvm/core/viewmodels/login_model.dart';
import 'package:flutter_mvvm/core/viewmodels/home_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => TodosService());

  locator.registerFactory(() => HomePageModel());
  locator.registerFactory(() => LoginPageModel());
}
