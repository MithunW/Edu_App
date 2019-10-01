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
          child: buildDrawer(size, padding),
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

  Widget buildDrawer(size, padding) {
    double height = size.height - padding.top - padding.bottom;
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          color: Colors.green[400],
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                size.width * 0.05, height * 0.25, size.width * 0.05, 0.0),
            child: ListTile(
              title: Text(
                'Item 1',
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
          ),
        ),
        Container(
          color: Colors.green[800],
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                size.width * 0.05, height * 0.25, size.width * 0.05, 0.0),
            child: ListTile(
              title: Text(
                'Item 1',
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
          ),
        ),
        Container(
          color: Colors.green[400],
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                size.width * 0.05, height * 0.25, size.width * 0.05, 0.0),
            child: ListTile(
              title: Text(
                'Item 1',
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
          ),
        ),
        Container(
          color: Colors.green[800],
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                size.width * 0.05, height * 0.25, size.width * 0.05, 0.0),
            child: ListTile(
              title: Text(
                'Item 1',
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
