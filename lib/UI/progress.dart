import 'package:flutter/material.dart';
import 'package:flutter/material.

class ProgressPage extends StatelessWidget {
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
    return Text('ui here');
  }
}

