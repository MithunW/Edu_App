import 'package:edu_app/Datalayer/Database.dart';
import 'package:flutter/material.dart';
import 'package:edu_app/UI/user.dart';

class LeaderboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ප්‍රමුඛ පුවරුව | Leaderboard'),
        ),
        body: Container(
          child: buildScreen(size),
        ),
        // bottomNavigationBar: builduserRank(),
      ),
    );
  }

  Widget buildScreen(size) {
    List list = Database.getUsers();
    return Container(
      child: Stack(
        children: [
          ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, position) {
              return buildUser(size, list, position);
            },
            // padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.1,
              width: size.width,
              color: Color.fromRGBO(30, 172, 80, 1),
              padding: EdgeInsets.fromLTRB(size.width * 0.08,
                  size.height * 0.02, size.width * 0.08, size.height * 0.02),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color.fromRGBO(36, 209, 99, 0.9),
                  ),
                  color: Colors.white,
                ),
                padding: EdgeInsets.fromLTRB(0, size.height * 0.005, 0, 0),
                //alignment: Alignment.centerLeft,
                child: Text("ඔබේ ස්ථානය - 12",
                    style: TextStyle(
                      fontSize: size.height * 0.035,
                      color: Colors.green[800],
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
