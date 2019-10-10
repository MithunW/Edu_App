import 'package:edu_app/Datalayer/paperShowcase.dart';
import 'package:edu_app/Datalayer/models/readPaper.dart';
import 'package:edu_app/UI/quizpage.dart';
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

  Widget buildPaperScreen(size, context, paperdetails) {
    return FutureBuilder(
        future: loadPaper(paperdetails.name),
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
