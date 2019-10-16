import 'package:edu_app/Datalayer/classes/paperShowcase.dart';
import 'package:edu_app/UI/Paper UI/quizpage.dart';
import 'package:edu_app/UI/colors.dart';
import 'package:flutter/material.dart';

class PaperScreen extends StatelessWidget {
  static const routeName = '/doThePaper';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final PaperShowcase papershowcase =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: buildPaperScreen(size, context, papershowcase),
    );
  }

  Widget buildPaperScreen(size, context, papershowcase) {
    return FutureBuilder(
        future: papershowcase.loadPaper(papershowcase.name),
        builder: (context, paper) {
          switch (paper.connectionState) {
            case ConnectionState.none:
              return Text('No Papers to show');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  size.width * 0.35,
                  size.height * 0.425,
                  size.width * 0.35,
                  size.height * 0.425,
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: size.height * 0.05,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.colors[1].color,
                      //color: Color.fromRGBO(36, 209, 99, 0.9),
                    ),
                    color: Colors.white,
                  ),
                  child: Text('Loading Paper'),
                ),
              );
            case ConnectionState.done:
              if (paper.hasError) return Text('Error: ${paper.error}');
              paper.data.setUrl(papershowcase.url);
              return paper.data != null
                  ? SafeArea(
                      child: Scaffold(
                        body: QuizPage(paper: paper.data),
                      ),
                    )
                  : Center(child: CircularProgressIndicator());
          }
          return null; //unreachable
        });
  }
}
