import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('සැකසුම් | Settings'),
        ),
        body: Container(
          child: buildScreen(),
        ),
      ),
    );
  }

  Widget buildScreen() => SingleChildScrollView(
        child: Theme(
          data: ThemeData(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //1
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "General Setting",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 2.0,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      title: Text("Account"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.mail,
                        color: Colors.red,
                      ),
                      title: Text("Gmail"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.sync,
                        color: Colors.blue,
                      ),
                      title: Text("Sync Data"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.sim_card,
                        color: Colors.grey,
                      ),
                      title: Text("Simcard & Network"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.wifi,
                          color: Colors.amber,
                        ),
                        title: Text("Wifi"),
                        trailing: Switch(
                          onChanged: (value) {},
                          value: true,
                        )),
                    ListTile(
                      leading: Icon(
                        Icons.bluetooth,
                        color: Colors.blue,
                      ),
                      title: Text("Bluetooth"),
                      trailing: Switch(
                        onChanged: (value) {},
                        value: false,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.more_horiz,
                        color: Colors.grey,
                      ),
                      title: Text("More"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
