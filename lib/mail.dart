// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class MailHelper extends StatefulWidget {
//   const MailHelper({Key? key}) : super(key: key);

//   @override
//   State<MailHelper> createState() => _MailHelperState();
// }

// class _MailHelperState extends State<MailHelper> {
//   final controller1 = TextEditingController();
//   final controller12 = TextEditingController();
//   final controller123 = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => sendMail(
//             to: controller1.text,
//             Title: controller12.text,
//             Message: controller123.text),
//       ),
//       body: Column(
//         children: [
//           Text("To"),
//           SizedBox(
//             height: 20,
//           ),
//           TextField(
//             controller: controller1,
//             style: TextStyle(fontSize: 10),
//           ),
//           Text("Title", style: TextStyle(fontWeight: FontWeight.bold)),
//           SizedBox(
//             height: 40,
//           ),
//           TextField(
//             controller: controller12,
//             style: TextStyle(fontSize: 15),
//           ),
//           Text(
//             "Message",
//             style: TextStyle(color: Colors.green, fontSize: 40),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           TextField(
//             controller: controller123,
//             style: TextStyle(fontSize: 30),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Future sendMail({
//   required String to,
//   required String Title,
//   required String Message,
// }) async {
//   final url =
//       'mailto:$to?subject:${Uri.encodeFull(Title)}&body:${Uri.encodeFull(Message)}';
//   if (await (canLaunch(url))) {
//     await launch(url);
//   }
// }
