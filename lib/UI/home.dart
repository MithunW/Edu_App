import 'package:edu_app/UI/aboutus.dart';
import 'package:edu_app/UI/colors.dart';
import 'package:edu_app/UI/leaderboard.dart';
import 'package:edu_app/UI/Paper UI/paperview.dart';
import 'package:edu_app/UI/progress.dart';
import 'package:edu_app/UI/settings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('පහේ පන්තිය | Grade 5'),
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColor.colors[4].color,
            image: DecorationImage(
                alignment: Alignment.bottomCenter,
                image: AssetImage('assets/images/boygirl.png'),
                fit: BoxFit.scaleDown),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(
              size.width * 0.02,
              size.height * 0.02,
              size.width * 0.02,
              size.height * 0.05,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      color: AppColor.colors[0].color,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.03,
                            size.height * 0.03,
                            size.width * 0.03,
                            size.height * 0.03),
                        child: FlatButton(
                          onPressed: () {
                            //Navigator.pushNamed(context, '/papers');
                            Navigator.of(context).push(PaperPageRoute());
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.library_books,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(
                                'ප්‍රශ්න පත්‍ර',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Papers',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    Card(
                      color: AppColor.colors[0].color,
                      child: Padding(
                        padding: EdgeInsets.all(size.width * 0.06),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(ProgressPageRoute());
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.show_chart,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(
                                'ප්‍රගතිය',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Progress',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      color: AppColor.colors[0].color,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.07,
                            size.height * 0.03,
                            size.width * 0.07,
                            size.height * 0.03),
                        child: FlatButton(
                          onPressed: () {},
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.book,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(
                                'පාඩම්',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Lessons',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    Card(
                      color: AppColor.colors[0].color,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.016,
                            size.height * 0.03,
                            size.width * 0.016,
                            size.height * 0.03),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(LeaderboardPageRoute());
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.insert_chart,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(
                                'ප්‍රමුඛ පුවරුව',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Leaderboard',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      color: AppColor.colors[0].color,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.07,
                            size.height * 0.03,
                            size.width * 0.07,
                            size.height * 0.03),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(SettingsPageRoute());
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.settings,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(
                                'සැකසුම්',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Settings',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    Card(
                      color: AppColor.colors[0].color,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.07,
                            size.height * 0.03,
                            size.width * 0.07,
                            size.height * 0.03),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(AboutUsPageRoute());
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.supervised_user_circle,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(
                                'අපි ගැන',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'About Us',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
