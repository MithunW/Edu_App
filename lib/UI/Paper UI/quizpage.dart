import 'dart:async';
import 'package:edu_app/Datalayer/classes/paper.dart';
import 'package:edu_app/UI/colors.dart';
import 'package:edu_app/UI/Paper UI/quizfinish.dart';
import 'package:flutter/material.dart';
//TODO: FIXME
//A bug occured during test run.
//Timer was set to 90 minutes and after about 10-15 minutes execption occured.
//It had something to do with tickerproviderstatemixin
//Application didn't respond.

//Another bug on timer submit throws an exception.

class QuizPage extends StatefulWidget {
  final Paper paper;

  const QuizPage({Key key, @required this.paper}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  int _currentIndex = 0;
  int timer;
  int correct = 0;
  bool canceltimer = false;
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration:
          // Duration(hours: widget.paper.htime, minutes: widget.paper.mtime),
          Duration(seconds: 100),
    );
    controller.reverse(from: 1.0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    starttimer();

    //reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
    Size size = MediaQuery.of(context).size;
    Question question = widget.paper.qs[_currentIndex];
    final List<Answer> options = question.as;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _key,
        body: Container(
          decoration: BoxDecoration(
            // image: DecorationImage(
            //   alignment: Alignment.bottomCenter,
            //   image: AssetImage('assets/images/boygirl.png'),
            // ),
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
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: AppColor.colors[2].color,
                      ),
                      height: size.height * 0.07,
                      width: size.width * 0.85,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Time Remaining : ",
                            style: TextStyle(
                              color: AppColor.colors[1].color,
                              fontSize: size.height * 0.03,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: AppColor.colors[3].color,
                            ),
                            alignment: Alignment.center,
                            height: size.height * 0.05,
                            width: size.width * 0.3,
                            child: AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget child) {
                                  return Text(
                                    timerString,
                                    style: TextStyle(
                                      fontSize: size.height * 0.03,
                                      color: Colors.white,
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Container(
                      color: Colors.white,
                      height: size.height * 0.005,
                      width: size.width,
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      child: Text("${_currentIndex + 1}"),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: size.width * 0.05),
                        Expanded(
                          child: Text(
                            widget.paper.qs[_currentIndex].q.t,
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0)),
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ...options.map(
                              (option) => Container(
                                  child: RadioListTile(
                                title: Text("${option.t}"),
                                groupValue: _answers[_currentIndex],
                                value: option.t,
                                onChanged: (value) {
                                  setState(() {
                                    _answers[_currentIndex] = option.t;
                                  });
                                },
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white70,
                      ),
                      height: size.height * 0.06,
                      width: size.width * 0.45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: _currentIndex == (0)
                                ? Icon(null)
                                : Icon(Icons.arrow_back_ios),
                            color: AppColor.colors[1].color,
                            onPressed: _previous,
                          ),
                          SizedBox(width: size.width * 0.05),
                          CircleAvatar(
                            backgroundColor: AppColor.colors[1].color,
                            child: Text(
                              "${_currentIndex + 1}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(width: size.width * 0.045),
                          IconButton(
                            icon: _currentIndex == (widget.paper.qs.length - 1)
                                ? Icon(null)
                                : Icon(Icons.arrow_forward_ios),
                            color: AppColor.colors[1].color,
                            onPressed: _next,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: _currentIndex == (widget.paper.qs.length - 1)
                          ? RaisedButton(
                              color: AppColor.colors[1].color,
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: _submit,
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${(duration.inHours % 60).toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void starttimer() {
    timer = 100;
    //timer = (widget.paper.htime * 60 * 60) + (widget.paper.mtime * 60);
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      if (timer < 2) {
        t.cancel();
        _submitTimer();
      } else if (canceltimer == true) {
        t.cancel();
      } else {
        timer--;
      }
    });
  }

  void _previous() {
    if (_currentIndex > (0)) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  void _next() {
    if (_answers[_currentIndex] == null) {
      _key.currentState.showSnackBar(SnackBar(
        content: Text("You must select an answer to continue."),
      ));
      return;
    }
    if (_currentIndex < (widget.paper.qs.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  void _submit() {
    if (_answers[_currentIndex] == null) {
      _key.currentState.showSnackBar(SnackBar(
        content: Text("You must select an answer to continue."),
      ));
      return;
    } else if (_currentIndex == (widget.paper.qs.length - 1)) {
      canceltimer = true;
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          nextPage();
        });
      });
    }
  }

  void nextPage() {
    canceltimer = true;
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>
            QuizFinishedPage(questions: widget.paper.qs, answers: _answers)));
  }

  void _submitTimer() {
    _key.currentState.showSnackBar(SnackBar(
      content: Text("Time is Up !"),
    ));
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        nextPage();
      });
    });
  }

  Future<bool> _onWillPop() async {
    return showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text(
                "Are you sure you want to quit the quiz? All your progress will be lost."),
            title: Text("Warning!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  canceltimer = true;

                  Navigator.pop(context, true);
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          );
        });
  }
}
