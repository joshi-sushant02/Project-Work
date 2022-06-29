import 'dart:ui';

import 'package:firebase1/create_mou/create.dart';
import 'package:firebase1/create_mou/uploadApi.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;

import '../utils/fileUpload.dart';

Widget fields(String text, String hintText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 40,
        width: 400,
        child: TextFormField(
          onChanged: (val) {},
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: hintText,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget title(String text) {
  return Center(
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.white, fontSize: 35, fontWeight: FontWeight.w400),
    ),
  );
}

Widget button1(Future pickfile()) {
  return FlatButton(
    onPressed: () => pickfile,
    child: SizedBox(
      height: 40,
      width: 400,
      child: Center(
        child: Text("Select file"),
      ),
    ),
    autofocus: true,
    color: Color(0xFF64C636),
  );
}

Widget dialog(BuildContext cnt) {
  return SimpleDialog(
    backgroundColor: Color(0xFF2D376E),
    // shape: Border(left: BorderSide(width: 2, color: Colors.black)),
    title: Row(
      children: <Widget>[
        Icon(
          Icons.error,
          color: Color(0xFFF2C32C),
        ),
        SizedBox(
          width: 4.0,
        ),
        Flexible(
          child: Text(
            "Please Wait",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          ),
        )
      ],
    ),
    contentPadding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
    children: <Widget>[
      createMouState.task != null
          ? buildUploadStatus(createMouState.task!)
          : Text(
              "You haven't selected any file",
              style: TextStyle(color: Colors.white),
            ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFFF2C32C))),
            onPressed: () {
              Navigator.of(cnt).pop();
            },
            child: Text(
              "Next",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      )
    ],
  );
}
