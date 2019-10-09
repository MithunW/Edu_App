import 'package:edu_app/UI/colors.dart';
import 'package:edu_app/UI/leaderboard.dart';
import 'package:edu_app/UI/rootpage.dart';
import 'package:edu_app/UI/progress.dart';
import 'package:edu_app/UI/settings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  final _pages = [
    RootPage(),
    ProgressPage(),
    LeaderboardPage(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            //background color of the BottomNavigationBar
            canvasColor: AppColor.colors[1].color,
            //active color of the BottomNavigationBar
            primaryColor: Colors.white,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: new TextStyle(
                    color: Colors
                        .yellow))), //inactive color of the BottomNavigationBar
        child: BottomNavigationBar(
          selectedItemColor: AppColor.colors[2].color,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.show_chart),
                title: Text(
                  'Progress',
                )),
            BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart),
              title: Text('Leaderboard'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: _pages[_selectedPage],
    );
  }
}
