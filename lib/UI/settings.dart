import 'package:edu_app/UI/colors.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Container(child: buildScreen(context)));
  }

  Widget buildScreen(context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
                      color: AppColor.colors[1].color,
                    ),
                    title: Text(
                      "Account",
                      style: TextStyle(
                        color: AppColor.colors[1].color,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: AppColor.colors[1].color,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.android,
                      color: AppColor.colors[1].color,
                    ),
                    title: Text(
                      "Color",
                      style: TextStyle(
                        color: AppColor.colors[1].color,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: AppColor.colors[1].color,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  ListTile(
                      leading: Icon(
                        Icons.notifications,
                        color: AppColor.colors[1].color,
                      ),
                      title: Text(
                        "Notifications",
                        style: TextStyle(
                          color: AppColor.colors[1].color,
                        ),
                      ),
                      trailing: Switch(
                        activeColor: AppColor.colors[1].color,
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
}
