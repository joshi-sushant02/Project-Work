import 'package:firebase1/bottom_drawer/bottom_drawer.dart';
import 'package:firebase1/create_mou/create.dart';
import 'package:firebase1/notifications_tab/notifications_tab.dart';
import 'package:firebase1/profile/profile.dart';
import 'package:firebase1/utils/calander.dart';
import 'package:firebase1/utils/fileUpload.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Stepper/stepper0.dart';
import 'notifications_tab/notifications_tab_bar.dart';

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
        // 'home': (cntx) => createMou(),
        // 'tracking': (cntx) => Stepper4(),
        // 'profile': (cntx) => const Profile(),
        // 'file Upload': (cntx) => const FirebaseApk(),
        // 'Calender': (context) => const Calendar()
        'Notifications': (cntx) => const Notifications(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Notifications(),
      home: CreateMou(),
    );
  }
}
