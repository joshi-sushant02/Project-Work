import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;

import '../utils/fileUpload.dart';

Widget fields(String text, String hintText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 50,
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
