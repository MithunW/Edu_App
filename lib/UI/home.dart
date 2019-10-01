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
        backgroundColor: Colors.amber,
        appBar: AppBar(),
        body: buildHome(),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromRGBO(0, 172, 36, 1),
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 50.0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget buildHome() {
    return Container(
      child: Text('hello'),
    );
  }
}
