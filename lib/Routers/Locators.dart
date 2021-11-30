import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ScreenUtil());
}
