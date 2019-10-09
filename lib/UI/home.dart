// import 'package:edu_app/Datalayer/Database.dart';
import 'package:flutter/material.dart';
import 'package:edu_app/UI/drawer.dart';
import 'package:edu_app/UI/paper_home.dart';
import 'package:edu_app/models/readPaper.dart';

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
            style: TextStyle(
              fontSize: size.height * 0.03,
            ),
          ),
        ),
        body: FutureBuilder(
            future: loadPaper(),
            builder: (context, snapshot) {
              return snapshot.data != null
                  ? buildHome(snapshot.data, size, context)
                  : Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  Widget buildHome(paper, size, context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, position) {
          return buildPaper(context, size, position, paper);
        },
      ),
    );
  }
}
