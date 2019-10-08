import 'package:edu_app/UI/aboutus.dart';
import 'package:edu_app/UI/home.dart';
import 'package:edu_app/UI/leaderboard.dart';
import 'package:edu_app/UI/onboarding.dart';
import 'package:edu_app/UI/quiz.dart';
import 'package:edu_app/UI/settings.dart';
import 'package:edu_app/UI/splash.dart';
import 'package:flutter/material.dart';
import 'package:edu_app/UI/progress.dart';

void main() {
  runApp(
    MaterialApp(
      title: "පහේ පන්තිය",
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(30, 172, 80, 1),
        accentColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/onBoarding': (context) => OnBoardingPage(),
        '/home': (context) => HomePage(),
        '/progress': (context) => ProgressPage(),
        '/leaderboard': (context) => LeaderboardPage(),
        '/settings': (context) => SettingsPage(),
        '/aboutus': (context) => AboutUsPage(),
        '/paper1': (context) => QuizPage(),
      },
    ),
  );
}
