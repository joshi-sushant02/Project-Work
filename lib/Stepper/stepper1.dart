//                       ------This is just another Stepper-------
//                                 Not that great.....











// import 'package:flutter/material.dart';
// import 'package:progress_timeline/progress_timeline.dart';

// class Stepper1 extends StatefulWidget {
//   const Stepper1({required this.title, String? string});
//   final String title;

//   @override
//   _Stepper1State createState() => _Stepper1State();
// }

// class _Stepper1State extends State<Stepper1> {
//   late ProgressTimeline screenProgress;

//   List<SingleState> allStages = [
//     SingleState(stateTitle: "Stage 1"),
//     SingleState(stateTitle: "Stage 2"),
//     SingleState(stateTitle: "Stage 3"),
//     SingleState(stateTitle: "Stage 4"),
//     SingleState(stateTitle: "Stage 5"),
//     SingleState(stateTitle: "Stage 6"),
//     SingleState(stateTitle: "Stage 7"),
//     SingleState(stateTitle: "Stage 8"),
//   ];

//   @override
//   void initState() {
//     screenProgress = new ProgressTimeline(
//       states: allStages,
//       iconSize: 35,
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
// //          crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12.0),
//               child: screenProgress,
//             ),
//             SizedBox(
//               height: 90,
//             ),
//             FlatButton(
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Text(
//                   "Goto Next Stage",
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ),
//               color: Colors.green,
//               shape: new RoundedRectangleBorder(
//                   borderRadius: new BorderRadius.circular(20.0)),
//               onPressed: () {
//                 screenProgress.gotoNextStage();
//               },
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             FlatButton(
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Text(
//                   "Goto Previous Stage",
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ),
//               color: Colors.green,
//               shape: new RoundedRectangleBorder(
//                   borderRadius: new BorderRadius.circular(20.0)),
//               onPressed: () {
//                 screenProgress.gotoPreviousStage();
//               },
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             FlatButton(
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Text(
//                   "Fail Current Stage",
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ),
//               color: Colors.green,
//               shape: new RoundedRectangleBorder(
//                   borderRadius: new BorderRadius.circular(20.0)),
//               onPressed: () {
//                 screenProgress.failCurrentStage();
//               },
//             )
//           ],
//         ),
//       ),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
