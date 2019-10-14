import 'package:flutter/material.dart';

Widget buildDrawer(context, size) {
  return ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      Container(
        height: size.height * 0.3,
        child: DrawerHeader(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/images/book.png'),
                height: size.height * 0.15,
                width: size.width * 0.4,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                'පහේ පන්තිය',
                style: TextStyle(
                    fontSize: size.height * 0.045,
                    color: Color.fromRGBO(30, 172, 80, 1)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      Container(
        height: size.height * 0.15,
        decoration: BoxDecoration(
          color: Color.fromRGBO(30, 172, 80, 1),
          border: Border.all(color: Colors.black12),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(0, size.height * 0.04, 0, 0),
          title: Text(
            'මගේ ප්‍රගතිය',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height * 0.03,
            ),
          ),
          subtitle: Text(
            'My Progress',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height * 0.025,
            ),
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
        height: size.height * 0.15,
        decoration: BoxDecoration(
          color: Color.fromRGBO(30, 172, 80, 1),
          border: Border.all(color: Colors.black12),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(0, size.height * 0.04, 0, 0),
          title: Text(
            'ප්‍රමුඛ පුවරුව',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height * 0.03,
            ),
          ),
          subtitle: Text(
            'Leaderboard',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height * 0.025,
            ),
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
        height: size.height * 0.15,
        decoration: BoxDecoration(
          color: Color.fromRGBO(30, 172, 80, 1),
          border: Border.all(color: Colors.black12),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(0, size.height * 0.04, 0, 0),
          title: Text(
            'සැකසුම්',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height * 0.03,
            ),
          ),
          subtitle: Text(
            'Settings',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height * 0.025,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Container(
        height: size.height * 0.15,
        decoration: BoxDecoration(
          color: Color.fromRGBO(30, 172, 80, 1),
          border: Border.all(color: Colors.black12),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(0, size.height * 0.04, 0, 0),
          title: Text(
            'අපි ගැන',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height * 0.03,
            ),
          ),
          subtitle: Text(
            'About Us',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height * 0.025,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/aboutus');
          },
        ),
      ),
    ],
  );
}