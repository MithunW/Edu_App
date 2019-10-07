import 'package:flutter/material.dart';

Widget buildPaper(size, list, position) {
  return Padding(
    padding: EdgeInsets.fromLTRB(size.width * 0.08, size.height * 0.02,
        size.width * 0.08, size.height * 0.02),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(36, 209, 99, 0.9),
      ),
      child: ExpansionTile(
        title: Text(
          list[position],
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height * 0.025,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                0.0, size.height * 0.06, 0.0, size.height * 0.06),
            child: Text('Buttons related to paper'),
          ),
        ],
      ),
    ),
  );
}
