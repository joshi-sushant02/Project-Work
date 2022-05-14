import 'package:flutter/material.dart';

import 'package:timeline_tile/timeline_tile.dart';

class Stepper4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF379A69),
      child: Theme(
        data: Theme.of(context).copyWith(
          accentColor: const Color(0xFF27AA69).withOpacity(0.2),
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: <Widget>[
                Expanded(child: _Timeline()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isFirst: true,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Color(0xFF27AA69),
              padding: EdgeInsets.all(6),
            ),
            endChild: _RightChild(
              asset: 'assets/done1.jpg',
              title: 'MOU CREATED',
              message: 'Initiator have created the MOU',
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFF27AA69),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Color(0xFF27AA69),
              padding: EdgeInsets.all(6),
            ),
            endChild: _RightChild(
              asset: 'assets/done1.jpg',
              title: 'Approval of 1',
              message: 'MOU is approved by 1.',
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFF27AA69),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Colors.yellow,
              padding: EdgeInsets.all(6),
            ),
            endChild: _RightChild(
              asset: 'assets/inprocess.jpg',
              title: 'Approval of 2',
              message: 'in process',
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFF27AA69),
            ),
            afterLineStyle: const LineStyle(
              color: Color(0xFFDADADA),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isLast: true,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Color(0xFFDADADA),
              padding: EdgeInsets.all(6),
            ),
            endChild: _RightChild(
              disabled: true,
              asset: 'assets/none2.jpg',
              title: 'Final Approval',
              message: 'waiting.....',
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFFDADADA),
            ),
          ),
        ],
      ),
    );
  }
}

class _RightChild extends StatelessWidget {
  _RightChild({
    required this.asset,
    required this.title,
    required this.message,
    this.disabled = false,
  });

  final String asset;
  final String title;
  final String message;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Opacity(
            opacity: disabled ? 0 : 1,
          ),
          const SizedBox(width: 16),
          Image.asset(asset, height: 30, width: 30),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: disabled
                      ? const Color(0xFFBABABA)
                      : const Color(0xFF636564),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                message,
                style: TextStyle(
                  color: disabled
                      ? const Color(0xFFD5D5D5)
                      : const Color(0xFF636564),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF9F9F9),
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE9E9E9),
            width: 3,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'ESTIMATED TIME',
                    style: TextStyle(
                      color: const Color(0xFFA2A2A2),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '30 minutes',
                    style: TextStyle(
                      color: const Color(0xFF636564),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'ORDER NUMBER',
                    style: TextStyle(
                      color: const Color(0xFFA2A2A2),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '#2482011',
                    style: TextStyle(
                      color: const Color(0xFF636564),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
