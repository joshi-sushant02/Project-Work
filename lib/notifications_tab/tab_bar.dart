import 'package:firebase1/notifications_tab/list.dart';
import 'package:firebase1/notifications_tab/tabs.dart';
import 'package:flutter/material.dart';

class NotiBar extends StatefulWidget {
  NotiBar({Key? key}) : super(key: key);

  @override
  NotiBarState createState() => NotiBarState();
}

class NotiBarState extends State<NotiBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int index = 0;
  static late List ontracklist;
  static late List delayedlist;

  @override
  void initState() {
    ontracklist = getonTracksList();
    delayedlist = getdelayedList();
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
      appBar: appbar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // tab bar view here
            Expanded(child: tabview()),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appbar() {
    return AppBar(
      backgroundColor: Color(0xFF2D376E),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: tabs(_tabController, index)),
      title: const Padding(
        padding: EdgeInsets.only(
          top: 35,
        ),
        child: Center(
          child: Text(
            'Notifications',
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget tabview() {
    return TabBarView(
      controller: _tabController,
      children: [
        // first tab bar view widget
        makeOnTrack,
        // second tab bar view widget
        makeDelayed
      ],
    );
  }
}
