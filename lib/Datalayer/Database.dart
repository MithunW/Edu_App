import 'package:flutter/material.dart';

class Database {
  static List<Widget> getPapers() {
    List list = new List<Widget>();
    int counter = 10;
    int count = counter;
    do {
      int paper = (count + 1) - counter;
      list.add(
        Text(
          'ප්‍රශ්න පත්‍රය $paper ',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),
        ),
      );
      counter--;
    } while (counter > 0);

    //TODO implement the backend connection for the function
    return list;
  }
}
