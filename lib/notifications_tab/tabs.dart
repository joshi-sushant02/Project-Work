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
                text: '${index}',
              ),

              // second tab [you can add an icon using the icon property]
              Tab(
                text: '${index}',
              ),
            ],
          ),
        ),
        // tab bar view here
      ],
    ),
  );
}
