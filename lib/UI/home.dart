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
    Size size = MediaQuery.of(context).size;
    var padding = MediaQuery.of(context).padding;
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: buildDrawer(context),
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
            color: Colors.green[800],
          ),
        ),
        Container(
          color: Colors.green[400],
          child: ListTile(
            title: Text(
              'Item 1',
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        Container(
          color: Colors.green[400],
          child: ListTile(
            title: Text(
              'Item 1',
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        Container(
          color: Colors.green[400],
          child: ListTile(
            title: Text(
              'Item 1',
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        Container(
          color: Colors.green[400],
          child: ListTile(
            title: Text(
              'Item 1',
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
