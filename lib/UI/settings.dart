import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Container(
          child: buildScreen(),
        ),
      ),
    );
  }

  Widget buildScreen() {
    return Text('ui here');
  }
}