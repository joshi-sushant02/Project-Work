import 'package:firebase1/notifications_tab/list.dart';
import 'package:flutter/material.dart';
import 'tab_bar.dart';

Widget tabs(TabController _tabController, int index) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
    child: Column(
      children: [
        // give the tab bar a height [can change hheight to preferred height]
        Container(
          height: 45,
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
              color: index == 0 ? Colors.green : Colors.red,
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
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      title: Text(
        onTrack.title,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(onTrack.description,
                  style: TextStyle(color: Colors.white))),
          Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(onTrack.date.toString(),
                  style: TextStyle(color: Colors.white))),
        ],
      ),
    );

Card makeCard(onTrack onTrack) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 75, 96, .9),
        ),
        child: makeListTile(onTrack),
      ),
    );
final makeOnTrack = Container(
  // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
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
  // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
  child: ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: NotiBarState.delayedlist.length,
    itemBuilder: (BuildContext context, int index) {
      return makeCard(NotiBarState.delayedlist[index]);
    },
  ),
);
