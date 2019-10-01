import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: SizedBox(
          width: size.width * 0.5,
          child: Drawer(
            child: buildDrawer(context),
          ),
        ),
        appBar: AppBar(
          title: Text("පහේ පන්තිය"),
        ),
        body: buildHome(),
      ),
    );
  }

  Widget buildHome() {
    return Container(
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, position) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                position.toString(),
                style: TextStyle(fontSize: 22.0),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildDrawer(context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            color: Colors.green[500],
          ),
        ),
        Container(
          color: Colors.green[400],
          child: ListTile(
            title: Text(
              'Progress',
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/progress');
            },
          ),
        ),
        Container(
          color: Colors.green[400],
          child: ListTile(
            title: Text(
              'Leaderboard',
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/leaderboard');
            },
          ),
        ),
        Container(
          color: Colors.green[400],
          child: ListTile(
            title: Text(
              'Settings',
              textAlign: TextAlign.center,
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
