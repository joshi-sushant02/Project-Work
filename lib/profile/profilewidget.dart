import 'package:flutter/material.dart';

Widget buildUserInfoDisplay(String getValue, String title) => Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
        ),
        Container(
            width: 350,
            height: 40,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.black,
              width: 1,
            ))),
            child: Row(children: [
              Expanded(
                  child: Text(
                getValue,
                style: TextStyle(
                    fontSize: 16, height: 1.4, fontWeight: FontWeight.bold),
              )),
              Icon(
                Icons.note_alt_outlined,
                // Icons.keyboard_arrow_right,
                color: Colors.black,
                size: 25.0,
              )
            ]))
      ],
    ));
