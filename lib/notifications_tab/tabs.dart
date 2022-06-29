import 'package:firebase1/notifications_tab/list.dart';
import 'package:flutter/material.dart';
import 'tab_bar.dart';

Widget tabs(TabController _tabController, int index) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
    child: Column(
      children: [
        // give the tab bar a height [can change hheight to preferred height]
        Container(
          height: 40,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(
              15.0,
            ),
          ),
          child: TabBar(
            padding: EdgeInsets.all(3),
            controller: _tabController,
            // give the indicator a decoration (color and border radius)

            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15.0,
              ),
              color: index == 0 ? Color(0xFF64C636) : Color(0xFFCD364E),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: [
              // first tab [you can add an icon using the icon property]
              Tab(
                text: 'On Track',
              ),

              // second tab [you can add an icon using the icon property]
              Tab(
                text: 'Delayed',
              ),
            ],
          ),
        ),
        // tab bar view here
      ],
    ),
  );
}

ListTile makeListTile(onTrack onTrack) => ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            onTrack.title,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(onTrack.description,
                  style: TextStyle(color: Colors.black))),
          Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(onTrack.date.toString(),
                  style: TextStyle(color: Colors.black))),
        ],
      ),
    );

Container makeCard(onTrack onTrack) => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(blurRadius: 0.1)]),
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFEDF9FF),
          borderRadius: BorderRadius.circular(15),
        ),
        child: makeListTile(onTrack),
      ),
    );
final makeOnTrack = Container(
  child: ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: NotiBarState.ontracklist.length,
    itemBuilder: (BuildContext context, int index) {
      return makeCard(NotiBarState.ontracklist[index]);
    },
  ),
);
final makeDelayed = Container(
  child: ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: NotiBarState.delayedlist.length,
    itemBuilder: (BuildContext context, int index) {
      return makeCard(NotiBarState.delayedlist[index]);
    },
  ),
);
