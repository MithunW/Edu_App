import 'package:edu_app/Datalayer/Database.dart';
import 'package:edu_app/UI/colors.dart';
import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('ප්‍රමුඛ පුවරුව | Leaderboard'),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/leaderbg.jpg'),
                fit: BoxFit.fitHeight),
          ),
          child: buildScreen(context)),
    );
  }

  Widget buildScreen(context) {
    var size = MediaQuery.of(context).size;
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
            child: buildMe(size),
          ),
        ],
      ),
    );
  }

  Widget buildUser(size, list, position) {
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * 0.08, size.height * 0.02,
          size.width * 0.08, size.height * 0.02),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColor.colors[1].color,
            //color: Color.fromRGBO(36, 209, 99, 0.9),
          ),
          color: Colors.white,
        ),
        child: ListTile(
          leading: Text(
            (position + 1).toString(),
            style: TextStyle(
              fontSize: 20,
              color: Colors.green[900],
            ),
          ),
          trailing: Stack(children: [
            Icon(Icons.grade, color: AppColor.colors[3].color, size: 24.0),
            Text("      ලකුණු",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.colors[1].color,
                )),
          ]),
          title: Text(
            list[position],
            style: TextStyle(
              color: AppColor.colors[1].color,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMe(size) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.colors[5].color,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(size.width * 0.08, size.height * 0.02,
            size.width * 0.08, size.height * 0.02),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColor.colors[1].color,
              //color: Color.fromRGBO(36, 209, 99, 0.9),
            ),
            color: Colors.white,
          ),
          child: ListTile(
            leading: Text(
              '4',
              style: TextStyle(
                fontSize: 20,
                color: Colors.green[900],
              ),
            ),
            trailing: Stack(children: [
              Icon(Icons.grade, color: AppColor.colors[3].color, size: 24.0),
              Text("      179",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.colors[1].color,
                  )),
            ]),
            title: Text(
              'Username',
              style: TextStyle(
                color: AppColor.colors[1].color,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
