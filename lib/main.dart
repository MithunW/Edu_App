import 'package:edu_app/UI/colors.dart';
import 'package:edu_app/UI/home.dart';
import 'package:edu_app/UI/Onboarding/onboarding.dart';
import 'package:edu_app/UI/Paper UI/paperScreen.dart';
import 'package:edu_app/UI/splash.dart';
import 'package:flutter/material.dart';
// import 'Datalayer/models/connectivity.dart';

void main() {
  // ConnectionStatusSingleton connectionStatus =
  //     ConnectionStatusSingleton.getInstance();
  // connectionStatus.initialize();
  runApp(
    MaterialApp(
      title: "පහේ පන්තිය",
      theme: ThemeData(
          primaryColor: AppColor.colors[0].color,
          primaryColorDark: AppColor.colors[0].color),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/onBoarding': (context) => OnBoardingPage(),
        '/home': (context) => HomePage(),
        PaperScreen.routeName: (context) => PaperScreen(),
      },
    ),
  );
}
