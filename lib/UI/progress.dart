import 'package:flutter/material.dart';

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress'),
      ),
      body: Container(child: buildScreen()),
    );
  }

  Widget buildScreen() {
    return Text('ui here');
  }
}
