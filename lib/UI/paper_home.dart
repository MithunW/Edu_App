import 'package:edu_app/models/readPaper.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: buildHome(size, context));
  }

  Widget buildHome(size, context) {
    return FutureBuilder(
        future: loadPaper(),
        builder: (context, paper) {
          return paper.data != null
              ? Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.9), BlendMode.dstATop),
                      image: AssetImage('assets/images/bg.jpg'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, position) {
                      return buildPaper(context, size, position, paper);
                    },
                  ),
                )
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget buildPaper(context, size, position, paper) {
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * 0.08, size.height * 0.02,
          size.width * 0.08, size.height * 0.02),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color.fromRGBO(30, 172, 80, 1),
            //color: Color.fromRGBO(36, 209, 99, 0.9),
          ),
          color: Colors.white,
        ),
        child: ExpansionTile(
          title: Text(
            'Paper ${position + 1}',
            style: TextStyle(
              color: Color.fromRGBO(30, 172, 80, 1),
              fontSize: size.height * 0.025,
            ),
          ),
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  0.0, size.height * 0.06, 0.0, size.height * 0.06),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Color.fromRGBO(30, 172, 80, 1),
                    )),
                    child: FlatButton(
                      color: Colors.white,
                      child: Text(
                        'Do the Paper',
                        style: TextStyle(
                          color: Color.fromRGBO(30, 172, 80, 1),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/paper');
                      },
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.08,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Color.fromRGBO(30, 172, 80, 1),
                    )),
                    child: FlatButton(
                      color: Colors.white,
                      child: Text(
                        'Review',
                        style: TextStyle(
                          color: Color.fromRGBO(30, 172, 80, 1),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
