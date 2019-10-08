import 'package:edu_app/Datalayer/Database.dart';
import 'package:flutter/material.dart';
import 'package:edu_app/UI/drawer.dart';
import 'package:edu_app/UI/paper.dart';

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
        body: buildHome(size, context),
      ),
    );
  }

  Widget buildHome(size, context) {
    List list = Database.getPapers();
    return Container(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, position) {
          return buildPaper(context, size, list, position);
        },
      ),
    );
  }
}
