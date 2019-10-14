import 'package:edu_app/Datalayer/Database.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: buildQuiz(size),
      ),
    );
  }

  Widget buildQuiz(size) {
    List list = Database.getQuestions();
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            color: Colors.green,
            child: Text(list[0]),
          ),
          Card(
            child: Text(
              'Question should be here. Question should be here, Question should be here',
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Card(
            child: Text('Answer 1'),
          ),
          SizedBox(
            height: 10.0,
          ),
          Card(
            child: Text('Answer 2'),
          ),
          SizedBox(
            height: 10.0,
          ),
          Card(
            child: Text('Answer 3'),
          ),
          SizedBox(
            height: 10.0,
          ),
          Card(
            child: Text('Answer 4'),
          ),
        ],
      ),
    );
  }
}
