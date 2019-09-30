import 'dart:io';

import 'package:edu_app/UI/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "පහේ පන්තිය",
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(0, 172, 36, 1),
        accentColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => OnBoarding(),
        '/onboarding2': (context) => OnBoarding2()
      }));
}
