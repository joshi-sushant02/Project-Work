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
  static late List ontracklist;
  static late List delayedlist;

  @override
  void initState() {
    // ontracklist = getonTracksList();
    // delayedlist = getdelayedList();
    NotificationsData.showData();
    delayedlist = NotificationsData.delayedMap;
    ontracklist = NotificationsData.onTrackMap;

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
      appBar: appbar(_tabController, index),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // tab bar view here
            Expanded(child: tabview(_tabController)),
          ],
        ),
      ),
    );
  }
}
