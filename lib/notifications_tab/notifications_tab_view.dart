import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase1/notifications_tab/notifications_list.dart';
import 'package:firebase1/notifications_tab/notifications_tab.dart';
import 'package:firebase1/notifications_tab/notifications_tab_bar.dart';
import 'package:flutter/material.dart';

Widget tabview(
    TabController _tabController, List ontrackList, List delayedList) {
  return TabBarView(
    controller: _tabController,
    children: [
      // first tab bar view widget

      makeOnTrack(ontrackList),

      // second tab bar view widget
      makeDelayed(delayedList),
    ],
  );
}

Widget makeOnTrack(List ontrackList) => Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: ontrackList.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(ontrackList[index]);
        },
      ),
    );

Widget makeDelayed(List delayedList) => Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: delayedList.length,
        itemBuilder: (BuildContext context, int index) {
          print("object");
          return makeCard(delayedList[index]);
        },
      ),
    );

// Container makeCard(onTrack onTrack) => Container(
Container makeCard(Map onTrack) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFEDF9FF),
          borderRadius: BorderRadius.circular(15),
        ),
        child: makeListTile(onTrack),
      ),
    );

// ListTile makeListTile(onTrack onTrack) => ListTile(
ListTile makeListTile(Map onTrack) => ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // onTrack.title,
            onTrack["MOU NAME"],
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(
                  // onTrack.description,
                  onTrack["Description"],
                  style: const TextStyle(color: Colors.black))),
          Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_today_outlined),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                      // onTrack.date.toString(),
                      (onTrack["Due Date"] as Timestamp).toDate().toString(),
                      style: const TextStyle(color: Colors.black)),
                ],
              )),
        ],
      ),
    );
