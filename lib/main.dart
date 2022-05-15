import 'package:firebase1/bottom_drawer/bottom_drawer.dart';
import 'package:firebase1/profile/profile.dart';
import 'package:firebase1/utils/calander.dart';
import 'package:firebase1/utils/fileUpload.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Stepper/stepper4.dart';

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
      initialRoute: 'home',
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
