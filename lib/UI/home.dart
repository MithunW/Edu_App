import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return new HomePageState();
//   }
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: buildDrawer(),
        ),
        appBar: AppBar(),
        body: buildHome(),
      ),
    );
  }



  Widget buildHome() {
    return Center(
      child: Container(
          child: ListView(
        children: <Widget>[
          Card(
            child: Text("Paper 1"),
          ),
          Card(
            child: Text("Paper 2"),
          ),
          Card(
            child: Text("Paper 3"),
          ),
          Card(
            child: Text("Paper 4"),
          ),
        ],
      )),
    );
  }

  Widget buildDrawer() {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    );
  }
}
