import 'package:flutter/material.dart';

Widget buildPaper(context, size, list, position) {
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
      child: ExpansionTile(
        title: Text(
          list[position],
          style: TextStyle(
            color: Color.fromRGBO(30, 172, 80, 1),
            fontSize: size.height * 0.025,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                0.0, size.height * 0.06, 0.0, size.height * 0.06),
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.12,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Color.fromRGBO(30, 172, 80, 1),
                  )),
                  child: FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Do the Paper',
                      style: TextStyle(
                        color: Color.fromRGBO(30, 172, 80, 1),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, '/paper$position');
                    },
                  ),
                ),
                SizedBox(
                  width: size.width * 0.08,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Color.fromRGBO(30, 172, 80, 1),
                  )),
                  child: FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Review',
                      style: TextStyle(
                        color: Color.fromRGBO(30, 172, 80, 1),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
