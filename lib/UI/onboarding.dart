import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'onboardingScreens.dart';

class OnBoardingPageState extends State<OnBoardingPage> {
  final List<Widget> introWidgetsList = <Widget>[
    Page1(),
    Page2(),
    Page3(),
  ];
  final controller = new PageController();
  int currentPageValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildScreens(),
    );
  }

  Widget buildScreens() {
    return SafeArea(
      child: Container(
        child: Stack(
          children: [
            PageView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: introWidgetsList.length,
              onPageChanged: (int page) {
                getChangedPageAndMoveBar(page);
              },
              controller: controller,
              itemBuilder: (context, index) {
                return introWidgetsList[index];
              },
            ),
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 35),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < introWidgetsList.length; i++)
                          if (i == currentPageValue) ...[circleBar(true)] else
                            circleBar(false),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: currentPageValue == introWidgetsList.length - 1
                  ? true
                  : false,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 30.0),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    backgroundColor: Color.fromRGBO(30, 172, 80, 1),
                    label: Text(
                      'ආරම්භ කරන්න',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ), //Icon(Icons.arrow_forward),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getChangedPageAndMoveBar(int page) {
    currentPageValue = page;
    setState(() {});
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.orange : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new OnBoardingPageState();
  }
}
