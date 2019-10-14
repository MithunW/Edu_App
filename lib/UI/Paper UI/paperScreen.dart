import 'package:edu_app/Datalayer/classes/paperShowcase.dart';
import 'package:edu_app/Datalayer/models/paperServices.dart';
import 'package:edu_app/UI/Paper UI/quizpage.dart';
import 'package:flutter/material.dart';

class PaperScreen extends StatelessWidget {
  static const routeName = '/doThePaper';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final PaperShowcase paper = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: buildPaperScreen(size, context, paper),
    );
  }

  Widget buildPaperScreen(size, context, paper) {
    return FutureBuilder(
        future: loadPaper(paper.name),
        builder: (context, paper) {
          return paper.data != null
              ? SafeArea(
                  child: Scaffold(
                    body: QuizPage(paper: paper.data),
                  ),
                )
              : Center(child: CircularProgressIndicator());
        });
  }
}
