import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('සැකසුම් | Settings'),
        ),
        body: Container(
          child: buildScreen(size),
        ),
      ),
    );
  }

  Widget buildScreen(size) => SingleChildScrollView(
        child: Theme(
          data: ThemeData(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                color: Colors.white,
                elevation: 2.0,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Color.fromRGBO(30, 172, 80, 1),
                      ),
                      title: Text(
                        "Account",
                        style: TextStyle(
                          color: Color.fromRGBO(30, 172, 80, 1),
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Color.fromRGBO(30, 172, 80, 1),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.android,
                        color: Color.fromRGBO(30, 172, 80, 1),
                      ),
                      title: Text(
                        "Color",
                        style: TextStyle(
                          color: Color.fromRGBO(30, 172, 80, 1),
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Color.fromRGBO(30, 172, 80, 1),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.notifications,
                          color: Color.fromRGBO(30, 172, 80, 1),
                        ),
                        title: Text(
                          "Notifications",
                          style: TextStyle(
                            color: Color.fromRGBO(30, 172, 80, 1),
                          ),
                        ),
                        trailing: Switch(
                          activeColor: Color.fromRGBO(30, 172, 80, 1),
                          onChanged: (value) {},
                          value: true,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
