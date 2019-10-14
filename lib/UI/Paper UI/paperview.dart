import 'package:edu_app/UI/colors.dart';
import 'package:edu_app/Datalayer/classes/Database.dart';
import 'package:edu_app/UI/Paper UI/paperScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edu_app/Datalayer/models/downloadPaper.dart';

//This page is where all the papers are listed.

//Added cupertino ios routing animation through creating a routing class
class PaperPageRoute extends CupertinoPageRoute {
  PaperPageRoute() : super(builder: (BuildContext context) => new PaperPage());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: new PaperPage());
  }
}

class PaperPage extends StatelessWidget {
  final Database db = new Database();
  @override
  Widget build(BuildContext context) {
    //Future<List> list = db.getPapers();
    var size = MediaQuery.of(context).size; //Get current device size
    return Scaffold(
      appBar: AppBar(
        title: Text('Papers'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              AppColor.colors[1].color,
              AppColor.colors[3].color,
              AppColor.colors[3].color,
              AppColor.colors[3].color,
            ],
          ),
        ),
        child: FutureBuilder(
          future: db.getPapers(),
          builder: (context, projectSnap) {
            if (projectSnap.connectionState == ConnectionState.none &&
                projectSnap.hasData == null) {
              return Container(
                child: Text('No Papers to show'),
              );
            }
            return ListView.builder(
              itemCount: projectSnap.data.length,
              itemBuilder: (context, position) {
                return buildPapers(
                  context,
                  size,
                  projectSnap.data[position],
                ); //builds paper per item in the list from db
              },
            );
          },
        ),
      ),
    );
  }
}

Widget buildPapers(context, size, paper) {
  return Padding(
    padding: EdgeInsets.fromLTRB(size.width * 0.08, size.height * 0.02,
        size.width * 0.08, size.height * 0.02),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColor.colors[1].color,
          //color: Color.fromRGBO(36, 209, 99, 0.9),
        ),
        color: Colors.white,
      ),
      child: ExpansionTile(
        title: Text(
          'පෙරහුරු ප්‍රශ්න ප්‍රත්‍ර අංක ${paper.name}', // paper id here
          style: TextStyle(
            color: AppColor.colors[1].color,
            fontSize: size.height * 0.02,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                0.0, size.height * 0.06, 0.0, size.height * 0.06),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: AppColor.colors[1].color,
              )),
              child: createButton(paper, context),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget createButton(paper, context) {
  return FlatButton(
    color: Colors.white,
    child: Text(
      'ප්‍රශ්න පත්‍රය කරන්න',
      style: TextStyle(
        color: AppColor.colors[1].color,
      ),
    ),
    onPressed: () {
      downloadFile(
          'https://drive.google.com/uc?export=download&id=1rKxCuyHaKDE3V1ECuTsdjppe31QDQz4n',
          paper.name);

      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            content: Text('ප්‍රශ්ණ පත්‍රය කිරීමට ඔබ සූදානම්ද ?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, PaperScreen.routeName,
                      arguments: paper);
                },
                child: Text('ඔව්'),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('නැහැ')),
            ],
          );
        },
      );
    },
  );
}
