import 'package:edu_app/Datalayer/paper.dart';
import 'package:edu_app/Datalayer/paperShowcase.dart';
import 'package:edu_app/UI/colors.dart';
import 'package:edu_app/Datalayer/models/readPaper.dart';
import 'package:flutter/material.dart';

class PaperScreen extends StatelessWidget {
  static const routeName = '/doThePaper';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final PaperShowcase paper = ModalRoute.of(context).settings.arguments;
    return Scaffold(body: buildPaperScreen(size, context, paper));
  }

  Widget buildPaperScreen(size, context, paperdetails) {
    return FutureBuilder(
        future: loadPaper(paperdetails.name),
        builder: (context, paper) {
          return paper.data != null
              ? _buildQuiz(paper)
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildQuiz(paper) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Card(
              color: Colors.green,
              child: Text(paper.data.id),
            ),
            Card(
              child: Text(
                paper.data.qs[0].q.t,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Card(
              child: Text(paper.data.qs[0].as[0].t),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              child: Text(paper.data.qs[0].as[1].t),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              child: Text(paper.data.qs[0].as[2].t),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              child: Text(paper.data.qs[0].as[3].t),
            ),
          ],
        ),
      ),
    );
  }
}
