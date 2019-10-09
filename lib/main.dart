import 'package:edu_app/UI/colors.dart';
import 'package:edu_app/UI/home.dart';
import 'package:edu_app/UI/onboarding.dart';
import 'package:edu_app/UI/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "පහේ පන්තිය",
      theme: ThemeData(
          primaryColor: AppColor.colors[1].color,
          primaryColorDark: AppColor.colors[0].color),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/onBoarding': (context) => OnBoardingPage(),
        '/home': (context) => HomePage(),
      },
    ),
  );
}
