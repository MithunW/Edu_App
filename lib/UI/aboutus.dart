import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsPageRoute extends CupertinoPageRoute {
  AboutUsPageRoute()
      : super(builder: (BuildContext context) => new AboutUsPage());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: new AboutUsPage());
  }
}

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
