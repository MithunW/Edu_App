import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:edu_app/Datalayer/Database.dart';



Widget buildPaperProgress(size, list, position) {
  
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * 0.08, size.height * 0.02,
          size.width * 0.08, size.height * 0.02),
      child: Container(
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(36, 209, 99, 0.9),
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
                progressColor: Colors.greenAccent,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // drawer: Drawer(
        //   child: buildDrawer(context, size),
        // ),
        appBar: AppBar(
          title: Text(
            "මගේ ප්‍රගතිය",
            style: TextStyle(
              fontSize: size.height * 0.03,
            ),
          ),
        ),
        body: buildProgress(size),
      ),
    );
  }

  Widget buildProgress(size) {
    List list = Database.getPapers();
    return Container(
      child: ListView.builder(
        itemCount: list.length - 5,
        itemBuilder: (context, position) {
          return buildPaperProgress(size, list, position);
        },
      ),
    );
  }
}
