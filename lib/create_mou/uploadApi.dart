import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'create.dart';
import 'dart:io' as io;

class FirebaseApi {
  static Future fileUpload() async {
    if (createMouState.file == null) {
      print("not done");
      return;
    } else {
      String filename = (createMouState.file!.path).split('/').last;
      final location = 'files11/$filename';

      createMouState.task =
          FirebaseApi.uploadTask(location, createMouState.file!);
      //final snapshot = await createMouState.task!.whenComplete(() {});
      print("done");
    }
  }

  static UploadTask? uploadTask(String location, io.File file) {
    try {
      final refer = FirebaseStorage.instance.ref(location);
      return refer.putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
    return null;
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

Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
      stream: task.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final snap = snapshot.data!;
          final progress = snap.bytesTransferred / snap.totalBytes;
          final percentage = (progress * 100).toStringAsFixed(2);

          return Text(
            '$percentage %',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          );
        } else {
          return Text("Uploading...");
        }
      },
    );
