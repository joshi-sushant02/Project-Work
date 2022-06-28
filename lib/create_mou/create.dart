import 'package:file_picker/file_picker.dart';
import 'package:firebase1/create_mou/fields.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'uploadApi.dart';

class createMou extends StatefulWidget {
  createMou({Key? key}) : super(key: key);

  @override
  State<createMou> createState() => createMouState();
}

class createMouState extends State<createMou> {
  UploadTask? task;
  io.File? file;
  late Future<List<FirebaseFile>> _future;

  @override
  void initState() {
    super.initState();

    _future = FirebaseApi.listAll('/files11');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80),
              title("CREATE MOU"),
              const SizedBox(height: 20),
              fields("Field -1", "MOU NAME"),
              const SizedBox(height: 20),
              fields("Field -2", "Created On : Date"),
              const SizedBox(height: 20),
              fields("Field -3", "Description"),
              const SizedBox(height: 20),
              fields("Field -4", "Due Date"),
              const SizedBox(height: 20),
              fields("Field -5", "field5"),
              const SizedBox(height: 20),
              fields("Field -6", "field6"),
              const SizedBox(height: 20),
              Text(file == null ? "" : file!.path.split('/').last),
              FlatButton(
                  onPressed: pickFile,
                  child: Text(
                      "                           Select file                            "),
                  autofocus: true,
                  color: Color.fromARGB(255, 72, 202, 76)),
              OutlinedButton(
                onPressed: fileUpload,
                child: Text("Done"),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Future pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) {
      print("result null");
      return;
    } else {
      final filepath = result.files.single.path!;

      setState(() {
        file = io.File(filepath);
      });
    }
  }

  Future fileUpload() async {
    if (file == null) {
      print("not done");
      return;
    } else {
      String filename = (file!.path).split('/').last;
      final location = 'files11/$filename';

      await FirebaseApi.uploadTask(location, file!);

      print("done");
    }
  }
}
