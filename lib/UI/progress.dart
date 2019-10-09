import 'package:edu_app/UI/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:edu_app/Datalayer/Database.dart';

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
            image: DecorationImage(
              image: AssetImage('assets/images/leaderbg.jpg'),
              fit: BoxFit.fitHeight,
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
          color: AppColor.colors[1].color,
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
