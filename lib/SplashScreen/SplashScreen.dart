import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_multibashi/Constants/ColorConstants.dart';
import 'package:flutter_app_multibashi/Dashboard/DashboardScreen.dart';
import 'package:flutter_app_multibashi/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.marineBlueColor,
      body: Container(
        child: Center(
          child: Text(
            "WELCOME",
            style: TextStyle(
              color: Colors.white,
              fontSize: screenUtil.setSp(22.0),
            ),
          ),
        ),
      ),
    );
  }
}
