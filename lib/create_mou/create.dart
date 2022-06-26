import 'package:file_picker/file_picker.dart';
import 'package:firebase1/create_mou/fields.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io' as io;
import '../utils/fileUpload.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                "CREATE MOU",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 40),
              ),
              const SizedBox(height: 20),
              fields("Field -1", "MOU NAME"),
              const SizedBox(height: 20),
              fields("Field -2", "CREATED ON:DATE"),
              const SizedBox(height: 20),
              fields("Field -3", "PRICE"),
              const SizedBox(height: 20),
              fields("Field -4", "DUE DATE"),
              const SizedBox(height: 20),
              fields("Field -5", "Description"),
              const SizedBox(height: 20),
              fields("Field -6", ""),
              const SizedBox(height: 20),
              Text(file == null ? "" : file!.path.split('/').last),
              FlatButton(
                  onPressed: pickFile,
                  child:
                      Text("                  Select file                  "),
                  autofocus: true,
                  color: Colors.green),
              FlatButton(
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

      await FirebaseApi._uploadTask(location, file!);
      print("done");
    }
  }
}

class FirebaseApi {
  static UploadTask? _uploadTask(String location, io.File file) {
    try {
      final refer = FirebaseStorage.instance.ref(location);
      return refer.putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  static Future<List<FirebaseFile>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();
    final url = await getlink(result.items);
    return url
        .asMap()
        .map((index, url) {
          final ref = result.items[index];
          final name = ref.name;
          final file = FirebaseFile(ref: ref, name: name, url: url);
          return MapEntry(index, file);
        })
        .values
        .toList();
  }

  static Future<List<String>> getlink(List<Reference> ref) =>
      Future.wait(ref.map((ref) => ref.getDownloadURL()).toList());

  static Future download(Reference ref) async {
    try {
      final io.Directory systemTempDir = io.Directory.systemTemp;
      final io.File tempFile =
          io.File('/storage/emulated/0/Download/temp${ref.name}');
      if (tempFile.existsSync()) await tempFile.delete();

      await ref.writeToFile(tempFile);

      print('${systemTempDir.path}/temp${ref.name}'
          // 'Success!\n Downloaded ${ref.name} \n from bucket: ${ref.bucket}\n '
          // 'at path: ${ref.fullPath} \n'
          // 'Wrote "${ref.fullPath}" to tmp-${ref.name}',
          );
    } catch (e) {
      print(e);
    }
  }
}
