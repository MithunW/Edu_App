import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Progress'),
        ),
        body: Container(
          child: buildScreen(),
        ),
      ),
    );
  }

  Widget buildScreen() {
    return Text('Hello World. This page is about us');
  }
}
