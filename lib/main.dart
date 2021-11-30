import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_multibashi/Routers/Locators.dart';
import 'package:flutter_app_multibashi/SplashScreen/SplashScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ScreenUtil screenUtil = locator<ScreenUtil>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*Get it Locator*/
  setupLocator();
  /*Sets the device orientation in portrait mode*/
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      allowFontScaling: false,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
