// import 'dart:io';
// import 'package:firebase1/Stepper/stepper1.dart';
// import 'package:firebase1/Stepper/stepper2.dart';
// import 'package:firebase1/Stepper/stepper3.dart';
import 'package:firebase1/bottom_drawer/bottom_drawer.dart';
import 'package:firebase1/profile/profile.dart';
import 'package:firebase1/utils/calander.dart';
import 'package:firebase1/utils/fileUpload.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase1/mail.dart';
// import 'package:http/http.dart' as http;
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart';
// import 'dart:io' as io;
// import 'package:path_provider/path_provider.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'Stepper/stepper4.dart';

// import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '1',
      routes: {
        'home': (cntx) => BottomDrawer(),
        'tracking': (cntx) => Stepper4(),
        'profile': (cntx) => const Profile(),
        'file Upload': (cntx) => const FirebaseApk(),
        'Calender': (context) => const Calendar()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomDrawer(),
    );
  }
}





































// class FirebaseApk extends StatefulWidget {
//   const FirebaseApk({Key? key}) : super(key: key);

//   @override
//   State<FirebaseApk> createState() => _FirebaseApkState();
// }

// class _FirebaseApkState extends State<FirebaseApk> {
//   UploadTask? task;
//   io.File? file;
//   late Future<List<FirebaseFile>> _future;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _future = FirebaseApi.listAll('/files11');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.ac_unit),
//           onPressed: () {},
//         ),
//       ),
//       body:
//           //  Column(
//           //   children: [
//           FutureBuilder<List<FirebaseFile>>(
//               future: _future,
//               builder: (cxt, data) {
//                 switch (data.connectionState) {
//                   case ConnectionState.waiting:
//                     return Center(child: CircularProgressIndicator());
//                   default:
//                     if (data.hasError) {
//                       return Center(child: Text('Some error occurred!'));
//                     } else {
//                       final files = data.data!;

//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 12),
//                           Expanded(
//                             child: ListView.builder(
//                               itemCount: files.length,
//                               itemBuilder: (context, index) {
//                                 final file = files[index];

//                                 return buildFile(context, file);
//                               },
//                             ),
//                           ),
//                         ],
//                       );
//                     }
//                 }
//               }),
//       // Container(
//       //   child: Column(
//       //     children: [
//       //       OutlineButton(
//       //           onPressed: pickFile,
//       //           child: Text("Select file"),
//       //           autofocus: true,
//       //           highlightElevation: 2.0,
//       //           color: Colors.green),
//       //       SizedBox(height: 20),
//       //       OutlineButton(
//       //           onPressed: fileUpload,
//       //           child: Text("Upload"),
//       //           highlightElevation: 5.0,
//       //           focusColor: Colors.pink,
//       //           hoverColor: Colors.pinkAccent),
//       //       SizedBox(height: 20),
//       //       OutlineButton(
//       //           onPressed: () {},
//       //           child: Text("download"),
//       //           highlightElevation: 5.0,
//       //           focusColor: Colors.pink,
//       //           hoverColor: Colors.pinkAccent),
//       //       SizedBox(height: 20),
//       //     ],
//       //   ),
//       // ),
//       // ],
//       // ),
//     );
//   }

//   Future pickFile() async {
//     final result = await FilePicker.platform.pickFiles(allowMultiple: false);
//     if (result == null) {
//       print("result ni=ull");
//       return;
//     } else {
//       final filepath = result.files.single.path!;

//       setState(() {
//         file = io.File(filepath);
//       });
//     }
//   }

//   Future fileUpload() async {
//     if (file == null) {
//       print("not done");
//       return;
//     } else {
//       final filename = basename(file!.path);
//       final location = 'files11/$filename';

//       await FirebaseApi._uploadTask(location, file!);
//       print("done");
//     }
//   }
// }

// class FirebaseApi {
//   static UploadTask? _uploadTask(String location, io.File file) {
//     try {
//       final refer = FirebaseStorage.instance.ref(location);
//       return refer.putFile(file);
//     } on FirebaseException catch (e) {
//       print(e);
//     }
//   }

//   static Future<List<FirebaseFile>> listAll(String path) async {
//     final ref = FirebaseStorage.instance.ref(path);
//     final result = await ref.listAll();
//     final url = await getlink(result.items);
//     return url
//         .asMap()
//         .map((index, url) {
//           final ref = result.items[index];
//           final name = ref.name;
//           final file = FirebaseFile(ref: ref, name: name, url: url);
//           return MapEntry(index, file);
//         })
//         .values
//         .toList();
//   }

//   static Future<List<String>> getlink(List<Reference> ref) =>
//       Future.wait(ref.map((ref) => ref.getDownloadURL()).toList());

//   static Future download(Reference ref) async {
//     try {
//       final io.Directory systemTempDir = io.Directory.systemTemp;
//       final io.File tempFile =
//           io.File('/storage/emulated/0/Download/temp11${ref.name}');
//       if (tempFile.existsSync()) await tempFile.delete();

//       await ref.writeToFile(tempFile);

//       print('${systemTempDir.path}/temp${ref.name}'
//           // 'Success!\n Downloaded ${ref.name} \n from bucket: ${ref.bucket}\n '
//           // 'at path: ${ref.fullPath} \n'
//           // 'Wrote "${ref.fullPath}" to tmp-${ref.name}',
//           );
//     } catch (e) {
//       print(e);
//     }

//     // io.Directory dir = await getApplicationDocumentsDirectory();
//     // try {
//     //   final io.File file = io.File('/storage/emulated/0/Download/');
//     //   // final io.File file = io.File('${dir.path}/${ref.name}');
//     //   // print('${dir.path}/${ref.name}');
//     //   await ref.writeToFile(file);
//     //   print("done");
//     //   // print(object)
//     // } catch (e) {
//     //   print(e);
//     // }
//   }

// // Future<void> downloadFile(Reference ref) async {
// //     final String url = await ref.getDownloadURL();
// //     final http.Response downloadData = await http.get(Uri.parse(url));
// //     final io.Directory systemTempDir =io.Directory.systemTemp;
// //     final io.File tempFile = io.File('${systemTempDir.path}/tmp.jpg');
// //     if (tempFile.existsSync()) {
// //       await tempFile.delete();
// //     }
// //     await tempFile.create();
// //     final StorageFileDownloadTask task = ref.writeToFile(tempFile);
// //     final int byteCount = (await task.future).totalByteCount;
// //     var bodyBytes = downloadData.bodyBytes;
// //     final String name = await ref.getName();
// //     final String path = await ref.getPath();
// //     print(
// //       'Success!\nDownloaded $name \nUrl: $url'
// //       '\npath: $path \nBytes Count :: $byteCount',
// //     );
// //     _scaffoldKey.currentState.showSnackBar(
// //       SnackBar(
// //         backgroundColor: Colors.white,
// //         content: Image.memory(
// //           bodyBytes,
// //           fit: BoxFit.fill,
// //         ),
// //       ),
// //     );
// //   }
// // }

// }

// class FirebaseFile {
//   final Reference ref;
//   final String name;
//   final String url;

//   const FirebaseFile({
//     required this.ref,
//     required this.name,
//     required this.url,
//   });
// }

// Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
//     // leading: ClipOval(
//     //   child: Image.network(
//     //     file.url,
//     //     width: 52,
//     //     height: 52,
//     //     fit: BoxFit.cover,
//     //   ),
//     // ),
//     title: Text(
//       file.name,
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//         decoration: TextDecoration.underline,
//         color: Colors.blue,
//       ),
//     ),
//     onTap: () async {
//       await FirebaseApi.download(file.ref);
//     });
