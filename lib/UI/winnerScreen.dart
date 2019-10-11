import 'dart:async';
import 'package:edu_app/Datalayer/paper.dart';
import 'package:edu_app/UI/quizfinish.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new WinnerPage(),
  ));
}

class WinnerPage extends StatefulWidget {
  @override
  WinnerPageState createState() => new WinnerPageState();
}

class WinnerPageState extends State<WinnerPage> {
  ScreenArguments args;
  @override
  initState() {
    super.initState();
    this.args = ModalRoute.of(context).settings.arguments;
    new Timer(const Duration(seconds: 5), onClose);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage('assets/images/winner.jpg'))),
    ));
  }

  void onClose() async {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        maintainState: true,
        opaque: true,
        pageBuilder: (context, _, __) => new QuizFinishedPage(
              questions: args.questions,
              answers: args.answers,
            ),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
  }
}

class ScreenArguments {
  final List<Question> questions;
  final Map<int, dynamic> answers;

  ScreenArguments(this.questions, this.answers);
}
