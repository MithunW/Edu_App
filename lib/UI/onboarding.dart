import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              physics: AlwaysScrollableScrollPhysics(),
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
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 30.0),
                  child: FloatingActionButton(
                    onPressed: () {},
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(26))),
                    child: Icon(Icons.arrow_forward),
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

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        child: Card(
            color: Color.fromRGBO(0, 172, 36, 1),
            child: Image.asset('assets/images/monkey.jpg')),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
