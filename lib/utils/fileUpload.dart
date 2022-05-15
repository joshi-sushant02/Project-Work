import 'package:file_picker/file_picker.dart';
import 'package:firebase1/utils/fileDownload.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io' as io;

class FirebaseApk extends StatefulWidget {
  const FirebaseApk({Key? key}) : super(key: key);

  @override
  State<FirebaseApk> createState() => _FirebaseApkState();
}

class _FirebaseApkState extends State<FirebaseApk> {
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.ac_unit),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                FlatButton(
                    onPressed: pickFile,
                    child: Text("Select file"),
                    autofocus: true,
                    // highlightElevation: 2.0,
                    color: Colors.green),
                SizedBox(height: 20),
                FlatButton(
                    onPressed: fileUpload,
                    child: Text("Upload"),
                    // highlightElevation: 5.0,
                    focusColor: Colors.pink,
                    hoverColor: Colors.pinkAccent),
                SizedBox(height: 20),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => FileDownload())));
                    },
                    child: Text("download"),
                    // highlightElevation: 5.0,
                    focusColor: Colors.pink,
                    hoverColor: Colors.pinkAccent),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) {
      print("result ni=ull");
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

class FirebaseFile {
  final Reference ref;
  final String name;
  final String url;

  const FirebaseFile({
    required this.ref,
    required this.name,
    required this.url,
  });
}

Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
    title: Text(
      file.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        color: Colors.blue,
      ),
    ),
    onTap: () async {
      await FirebaseApi.download(file.ref);
    });
