import 'package:edu_app/Datalayer/paper.dart';
import 'package:edu_app/UI/colors.dart';
import 'package:edu_app/UI/reviewanswers.dart';
import 'package:flutter/material.dart';

class QuizFinishedPage extends StatelessWidget {
  final List<Question> questions;
  final Map<int, dynamic> answers;

  int correctAnswers;
  QuizFinishedPage({Key key, @required this.questions, @required this.answers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int correct = 0;
    Size size = MediaQuery.of(context).size;
    this.answers.forEach((index, value) {
      if (this.questions[index].as[questions[index].a - 1].t == value)
        correct++;
    });
    final TextStyle titleStyle = TextStyle(
        color: Colors.black87, fontSize: 22.0, fontWeight: FontWeight.w500);
    final TextStyle trailingStyle = TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 22.0,
        fontWeight: FontWeight.bold);

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/boygirl2.png'),
            alignment: Alignment.bottomCenter,
          ),
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
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              //color: Colors.white70,
              ),
          //height: size.height * 0.2,
          padding: EdgeInsets.fromLTRB(
            size.height * 0.05,
            size.height * 0.1,
            size.height * 0.05,
            0,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Score", style: titleStyle),
                  trailing: Text("${correct / questions.length * 100}%",
                      style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Correct Answers", style: titleStyle),
                  trailing: Text("$correct/${questions.length}",
                      style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Incorrect Answers", style: titleStyle),
                  trailing: Text(
                      "${questions.length - correct}/${questions.length}",
                      style: trailingStyle),
                ),
              ),
              SizedBox(height: 20.0),
              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.height * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: AppColor.colors[2].color,
                    child: Text(
                      "Review Answers",
                      style: TextStyle(
                          color: Colors.black, fontSize: size.height * 0.020),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => CheckAnswersPage(
                                questions: questions,
                                answers: answers,
                              )));
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: AppColor.colors[2].color,
                    child: Text(
                      "Home",
                      style: TextStyle(
                          color: Colors.black, fontSize: size.height * 0.020),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
