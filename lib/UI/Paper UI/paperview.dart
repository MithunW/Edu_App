import 'dart:async';
import 'dart:io';

import 'package:edu_app/UI/colors.dart';
import 'package:edu_app/Datalayer/classes/Database.dart';
import 'package:edu_app/UI/Paper UI/paperScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edu_app/Datalayer/models/paperServices.dart';

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
  bool isOffline = false;
  final Database db = new Database();
  @override
  Widget build(BuildContext context) {
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
          builder: (context, paperSnap) {
            switch (paperSnap.connectionState) {
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
                    child: Text('Loading Papers'),
                  ),
                );
              case ConnectionState.done:
                if (paperSnap.hasError)
                  return Text('Error: ${paperSnap.error}');
                return ListView.builder(
                  itemCount: paperSnap.data.length,
                  itemBuilder: (context, position) {
                    return buildPapers(
                      context,
                      size,
                      paperSnap.data[position],
                    ); //builds paper per item in the list from db
                  },
                );
            }
            return null; // unreachable
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
          'පෙරහුරු ප්‍රශ්න ප්‍රත්‍ර අංක ${paper.number}', // paper id here
          style: TextStyle(
            color: AppColor.colors[1].color,
            fontSize: size.height * 0.02,
          ),
        ),
        children: [
          Text(
            'කාලය : පැය ${paper.hTime} මිනිත්තු ${paper.mTime}',
            style: TextStyle(
              color: AppColor.colors[1].color,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                0.0, size.height * 0.02, 0.0, size.height * 0.06),
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
    onPressed: () async {
      await downloadFile(paper.url, paper.name);
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
