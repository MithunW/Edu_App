import 'package:edu_app/Datalayer/Database.dart';
import 'package:flutter/material.dart';
import 'package:edu_app/UI/user.dart';



class LeaderboardPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Leaderboard'),
        ),
        body: Container(
          child: buildScreen(size),
        ),
      ),
    );
  }
}
 Widget buildScreen(size) {
    List list = Database.getUsers();
    return Container(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, position) {
          return buildUser(size, list, position);
        },
      ),
    );
  }

