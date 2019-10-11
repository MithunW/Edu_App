import 'dart:async';

import 'package:edu_app/UI/colors.dart';
import 'package:edu_app/Datalayer/Database.dart';
import 'package:edu_app/UI/paperScreen.dart';
import 'package:flutter/material.dart';
import 'package:edu_app/Datalayer/models/downloadPaper.dart';

class RootPage extends StatelessWidget {
  final Database db = new Database();
  @override
  Widget build(BuildContext context) {
    List list = db.getPapers();
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('පහේ පන්තිය | Grade 5'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, position) {
              return buildPapers(context, size, list[position]);
            },
          ),
        ));
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
            'පෙරහුරු ප්‍රශ්න ප්‍රත්‍ර අංක ${paper.id}', // paper id here
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
    if (1==0) {
      // TODO: change the codition value to change the button action. should maitain a local db to see which papers are downloaded
      return FlatButton(
        color: Colors.white,
        child: Text(
          'මෙම ප්‍රශ්න පත්‍රය ලබාගන්න',
          style: TextStyle(
            color: AppColor.colors[1].color,
          ),
        ),
        onPressed: () {
          downloadFile(
              'https://drive.google.com/uc?export=download&id=1rKxCuyHaKDE3V1ECuTsdjppe31QDQz4n',
              paper.name);
        },
      );
    }
    return FlatButton(
      color: Colors.white,
      child: Text(
        'ප්‍රශ්න පත්‍රය කරන්න',
        style: TextStyle(
          color: AppColor.colors[1].color,
        ),
      ),
      onPressed: () {
        // downloadFile(
        //     'https://drive.google.com/uc?export=download&id=1rKxCuyHaKDE3V1ECuTsdjppe31QDQz4n',
        //     paper.name);
        
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
                    Navigator.pushReplacementNamed(
                        context, PaperScreen.routeName,
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
}
