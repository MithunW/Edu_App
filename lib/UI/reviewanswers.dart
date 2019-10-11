import 'package:edu_app/Datalayer/paper.dart';
import 'package:edu_app/UI/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckAnswersPage extends StatelessWidget {
  final List<Question> questions;
  final Map<int, dynamic> answers;

  const CheckAnswersPage(
      {Key key, @required this.questions, @required this.answers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: AppColor.colors[2].color,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context ),
            ),
          ),
          SizedBox(
            width: size.width * 0.08,
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: AppColor.colors[2].color,
            child: Text(
              "Home",
              style:
                  TextStyle(color: Colors.black, fontSize: size.height * 0.020),
            ),
            onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
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
        child: Container(
          padding: EdgeInsets.fromLTRB(size.width * 0.02, size.height * 0.08,
              size.width * 0.01, size.height * 0.08),
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: questions.length,
            itemBuilder: _buildItem,
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;

    Question question = questions[index];
    bool correct = question.as[question.a - 1].t == answers[index];
    return Card(
      child: Padding(
        padding: EdgeInsets.all(size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              " ${index + 1})  ${question.q.t})",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: size.height * 0.02,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "${answers[index]}",
              style: TextStyle(
                  color: correct ? Colors.green : Colors.red,
                  fontSize: size.height * 0.02,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            correct
                ? Container()
                : Text.rich(
                    TextSpan(children: [
                      TextSpan(text: "Answer: "),
                      TextSpan(
                          text: question.as[question.a - 1].t,
                          style: TextStyle(fontWeight: FontWeight.w500))
                    ]),
                    style: TextStyle(fontSize: size.height * 0.02),
                  )
          ],
        ),
      ),
    );
  }
}
