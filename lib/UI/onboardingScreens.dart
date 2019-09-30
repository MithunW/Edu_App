import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                new BoxShadow(
                  color: Colors.black38,
                  offset: new Offset(2.0, 2.0),
                )
              ],
              color: Color.fromRGBO(96, 186, 111, 1),
            ),
            child: Column(
              children: <Widget>[
                Container(
                    color: Color.fromRGBO(96, 186, 111, 1),
                    child: Image.asset('assets/images/owl.png')),
                Text(
                  'පහේ පන්තිය',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w200,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ]),
                )
              ],
            ),
            height: (MediaQuery.of(context).size.height) * 0.6,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                0.0, (MediaQuery.of(context).size.height) * 0.1, 0.0, 0.0),
            child: Text(
              'පහේ පන්තිය වෙත ඔබව සාදරයෙන් පිළිගනිමු',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(0, 172, 36, 1),
                fontSize: 20,
                fontWeight: FontWeight.w100,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black26,
                    offset: Offset(0.2, 0.2),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                new BoxShadow(
                  color: Colors.black38,
                  offset: new Offset(2.0, 2.0),
                )
              ],
              color: Color.fromRGBO(96, 186, 111, 1),
            ),
            child: Column(
              children: <Widget>[
                Container(
                    color: Color.fromRGBO(96, 186, 111, 1),
                    child: Image.asset('assets/images/owl.png')),
                Text(
                  'පහේ පන්තිය',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w200,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ]),
                )
              ],
            ),
            height: (MediaQuery.of(context).size.height) * 0.6,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                (MediaQuery.of(context).size.height) * 0.01,
                (MediaQuery.of(context).size.height) * 0.1,
                (MediaQuery.of(context).size.height) * 0.01,
                0.0),
            child: Text(
              'අලුත් විදියකට ඉගෙන ගන්න ඔබ සූදානම්ද ? පහේ පන්තියෙන් ඔබට සෑම සතියකම අලුත්ම ප්‍රශ්න පත්‍රයක්.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(0, 172, 36, 1),
                fontSize: 19,
                fontWeight: FontWeight.w100,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black26,
                    offset: Offset(0.2, 0.2),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String value = "";
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                new BoxShadow(
                  color: Colors.black38,
                  offset: new Offset(2.0, 2.0),
                )
              ],
              color: Color.fromRGBO(96, 186, 111, 1),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromRGBO(96, 186, 111, 1),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0,
                        (MediaQuery.of(context).size.height) * 0.04, 0.0, 0.0),
                    child: Text(
                      'ඔබේ තොරතුරු යොදා ඉදිරියට යන්න',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black26,
                              offset: Offset(0.5, 0.5),
                            ),
                          ]),
                    ),
                  ),
                )
              ],
            ),
            height: (MediaQuery.of(context).size.height) * 0.1,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                (MediaQuery.of(context).size.height) * 0.01,
                (MediaQuery.of(context).size.height) * 0.1,
                (MediaQuery.of(context).size.height) * 0.01,
                0.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "ළමයාගේ නම",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "හිස් විය නොහැක";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height) * 0.05,
                ),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "ශ්‍රේණිය",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "හිස් විය නොහැක";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height) * 0.05,
                ),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "දුරකතන අංකය",
                    //fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "හිස් විය නොහැක";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
