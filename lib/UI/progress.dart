import 'package:edu_app/UI/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:edu_app/Datalayer/classes/Database.dart';

class ProgressPageRoute extends CupertinoPageRoute {
  ProgressPageRoute()
      : super(builder: (BuildContext context) => new ProgressPage());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: new ProgressPage());
  }
}

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "මගේ ප්‍රගතිය | My Progress",
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage('assets/images/leaderbg.jpg'),
            //   fit: BoxFit.fitHeight,
            // ),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                AppColor.colors[1].color,
                AppColor.colors[3].color,
                AppColor.colors[3].color,
                AppColor.colors[3].color,
              ],
            ),
          ),
          child: buildProgress(size),
        ),
      ),
    );
  }

  Widget buildProgress(size) {
    List list = ["Paper 1", "Paper 2"];
    return Container(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, position) {
          return buildPaperProgress(size, list, position);
        },
      ),
    );
  }

  Widget buildPaperProgress(size, list, position) {
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * 0.08, size.height * 0.02,
          size.width * 0.08, size.height * 0.02),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.colors[0].color,
        ),
        child: ExpansionTile(
          title: Text(
            list[position],
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height * 0.025,
            ),
          ),
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  0.0, size.height * 0.005, 0.0, size.height * 0.02),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: new LinearPercentIndicator(
                  width: 250,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: 0.9,
                  center: Text("90.0%"),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: AppColor.colors[2].color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
