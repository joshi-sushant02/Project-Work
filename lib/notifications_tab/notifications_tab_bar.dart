import 'dart:async';

import 'package:firebase1/notifications_tab/notifications_list.dart';
import 'package:firebase1/notifications_tab/notifications_tab.dart';
import 'package:firebase1/notifications_tab/notifications_tab_view.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  NotificationsState createState() => NotificationsState();
}

class NotificationsState extends State<Notifications>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int index = 0;

  static Set ontracklist = {};
  static Set delayedlist = {};
  late final future = NotificationsData.newGet();

  @override
  void initState() {
    // ontracklist = getonTracksList();
    // delayedlist = getdelayedList();
    // NotificationsData.getData();
    // NotificationsData.showData();

    print("ïnside:");
    print(NotificationsData.onTrackMap);

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        index = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(_tabController, index, context),
        body:

            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Column(
            //       children: [
            //         // tab bar view here
            //         Expanded(
            //             child: tabview(_tabController, NotificationsData.onTrackMap,
            //                 NotificationsData.delayedMap)),
            //       ],
            //     ),
            //   ),
            // );

            FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // tab bar view here
                    Expanded(
                        child: tabview(
                            _tabController,
                            NotificationsData.getontrackMap(),
                            NotificationsData.getdelayedMap())),
                  ],
                ),
              );
            }
          },
        ));
  }
}
