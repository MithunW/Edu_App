import 'package:edu_app/Datalayer/Database.dart';
import 'package:flutter/material.dart';
import 'package:edu_app/UI/drawer.dart';

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
}
