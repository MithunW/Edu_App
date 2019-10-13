import 'dart:async';
import 'package:edu_app/UI/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:edu_app/UI/Onboarding/onboarding.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SplashState();
}

class SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new HomePage()));
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new OnBoardingPage()));
    }
  }

  @override
  void initState() {
    super.initState();

    new Timer(new Duration(milliseconds: 1000), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(size.width * 0.1, size.height * 0.4,
            size.width * 0.1, size.height * 0.4),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.blue[800],
              Colors.blue[700],
              Colors.blue[600],
              Colors.blue[400],
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                'Grade 5',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.height * 0.06,
                ),
              ),
              Text(
                'Loading ...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.height * 0.04,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
