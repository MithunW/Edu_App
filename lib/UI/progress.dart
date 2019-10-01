import 'package:flutter/material.dart';

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: buildScreen(),
        ),
      ),
    );
  }

  Widget buildScreen(){
    return Text('ui here');
  }
}
