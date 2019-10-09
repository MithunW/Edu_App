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
    return Scaffold(body: Text('Hello from the other side'));
  }

  Widget buildPaperScreen(size, context) {
    return FutureBuilder(
        future: loadPaper(),
        builder: (context, paper) {
          return paper.data != null
              ? null
              : Center(child: CircularProgressIndicator());
        });
  }
}
