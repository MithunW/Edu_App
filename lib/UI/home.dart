import 'package:edu_app/Datalayer/Database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: buildDrawer(context, size),
        ),
        appBar: AppBar(
          title: Text(
            "පහේ පන්තිය",
          ),
        ),
        body: buildHome(size),
      ),
    );
  }

  Widget buildHome(size) {
    List list = Database.getPapers();
    return Container(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, position) {
          return Padding(
            padding: EdgeInsets.fromLTRB(size.width * 0.08, size.height * 0.02,
                size.width * 0.08, size.height * 0.02),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(36, 209, 99, 0.9),
              ),
              child: ExpansionTile(
                title: list[position],
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0.0, size.height * 0.06, 0.0, size.height * 0.06),
                    child: list[position],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildDrawer(context, size) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, size.height * 0.05, 0.0, 0.0),
            child: Text(
              'පහේ පන්තිය',
              style: TextStyle(
                  fontSize: size.height * 0.05,
                  color: Color.fromRGBO(30, 172, 80, 1)),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(30, 172, 80, 1),
            border: Border.all(color: Colors.black12),
          ),
          child: ListTile(
            title: Text(
              'මගේ ප්‍රගතිය',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/progress');
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(30, 172, 80, 1),
            border: Border.all(color: Colors.black12),
          ),
          child: ListTile(
            title: Text(
              'ප්‍රමුඛ පුවරුව',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/leaderboard');
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(30, 172, 80, 1),
            border: Border.all(color: Colors.black12),
          ),
          child: ListTile(
            title: Text(
              'සැකසුම්',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ),
      ],
    );
  }
}
