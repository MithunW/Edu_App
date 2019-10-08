import 'package:flutter/material.dart';

Widget buildUser(size, list, position) {
  return Padding(
    padding: EdgeInsets.fromLTRB(size.width * 0.08, size.height * 0.02,
        size.width * 0.08, size.height * 0.02),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color.fromRGBO(30, 172, 80, 1),
          //color: Color.fromRGBO(36, 209, 99, 0.9),
        ),
        color: Colors.white,
      ),
      child: ListTile(
        title: Text(
          list[position],
          style: TextStyle(
            color: Color.fromRGBO(30, 172, 80, 1),
            fontSize: size.height * 0.025,
          ),
        ),
      ),
    ),
  );
}
