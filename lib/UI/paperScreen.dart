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
                    body: ListView.builder(
                      itemCount: paper.data.qs.length,
                      itemBuilder: (context, i) {
                        return _buildQuiz(i, paper, size);
                      },
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildQuiz(i, paper, size) {
    return Column(
      children: [
        ListTile(
          leading: Text(paper.data.qs[i].n.toString()),
          title: Text(paper.data.qs[i].q.t),
        ),
        ListTile(
          leading: Text(paper.data.qs[i].as[0].n.toString()),
          title: Text(paper.data.qs[i].as[0].t),
        ),
        ListTile(
          leading: Text(paper.data.qs[i].as[1].n.toString()),
          title: Text(paper.data.qs[i].as[1].t),
        ),
        ListTile(
          leading: Text(paper.data.qs[i].as[2].n.toString()),
          title: Text(paper.data.qs[i].as[2].t),
        ),
        ListTile(
          leading: Text(paper.data.qs[i].as[3].n.toString()),
          title: Text(paper.data.qs[i].as[3].t),
        ),
      ],
    );
  }
}
