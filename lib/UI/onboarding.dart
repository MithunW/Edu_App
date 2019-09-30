import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildScreen(context));
  }

  Widget buildScreen(context) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: Card(
            color: Color.fromRGBO(0, 172, 36, 1),
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                ),
                ListTile(
                    title: Center(
                  child: Text(
                    'පහේ පන්තිය',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                )),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Text(
          'පහ වසර වෙත ඔබව සාදරයෙන් පිළිගනිමු',
          style: TextStyle(color: Color.fromRGBO(0, 172, 36, 1), fontSize: 16),
        ),
        SizedBox(
          height: 100,
        ),
        RaisedButton(
          child: Text('ඉදිරියට යන්න'),
          onPressed: () {
            Navigator.pushNamed(context, '/onboarding2');
          },
        ),
      ],
    );
  }
}

class OnBoarding2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("පහේ පන්තිය"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('ඉදිරියට යන්න 2'),
          onPressed: () {
            Navigator.pushNamed(context, '/onboarding3');
          },
        ),
      ),
    );
  }
}
