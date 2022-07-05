import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase1/notifications_tab/notifications_tab_bar.dart';

class onTrack {
  String title;
  String description;
  DateTime date;

  onTrack({required this.title, required this.description, required this.date});
}

class delayed {
  String title;
  String description;
  DateTime date;

  delayed({required this.title, required this.description, required this.date});
}

List getonTracksList() {
  return [
    onTrack(
        title: "MOU-1",
        date: DateTime.now(),
        description: "lore  You should see a circular....."),
    onTrack(
        title: "MOU-2",
        date: DateTime.now(),
        description: "We provide best services in the world...."),
  ];
}

List getdelayedList() {
  return [
    onTrack(
        title: "MOU-3",
        date: DateTime.now(),
        description:
            "We provide best services in the world.rave suffered alteration in some ..."),
    onTrack(
        title: "MOU-4",
        date: DateTime.now(),
        description:
            "We provide best services in  of Lorem Ipsum avhave suffered alteration in some ..."),
  ];
}

class NotificationsData {
  static List delayedMap = [];
  static List onTrackMap = [];
  static List userList = [];

  static Future newGet() async {
    // delayedMap.clear();
    // onTrackMap.clear();
    // print("i was cleared");
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('MOUs').get();

    userList = querySnapshot.docs.map((e) => (e.data())).toList();
    // for (Map e in userList) {
    //   if ((e["Due Date"] as Timestamp)
    //       .toDate()
    //       .difference(DateTime.now())
    //       .isNegative) {
    //     delayedMap.add(e);
    //     print("iwasadded");
    //   } else {
    //     onTrackMap.add(e);
    //   }
    // }
    print("i was called");
  }

  static List getdelayedMap() {
    delayedMap.clear();
    for (Map e in userList) {
      if ((e["Due Date"] as Timestamp)
          .toDate()
          .difference(DateTime.now())
          .isNegative) {
        delayedMap.add(e);
      }
    }
    print("iwasadded");
    return delayedMap;
  }

  static List getontrackMap() {
    onTrackMap.clear();
    for (Map e in userList) {
      if (!((e["Due Date"] as Timestamp)
          .toDate()
          .difference(DateTime.now())
          .isNegative)) {
        onTrackMap.add(e);
      }
    }
    print("iwasadded");
    return onTrackMap;
  }
}
    // static Stream<Iterable<Map<String, dynamic>>> getData() {
    //   return FirebaseFirestore.instance
    //       .collection('MOUs')
    //       .snapshots()
    //       .map((event) => event.docs.map((e) => e.data()));
    // }

    // static showData() {
    //   delayedMap.clear();
    //   onTrackMap.clear();
    //   Stream<Iterable<Map<String, dynamic>>> stream;
    //   stream = getData();
    //   stream.listen((event) {
    //     for (Map e in event) {
    //       if ((e["Due Date"] as Timestamp)
    //           .toDate()
    //           .difference(DateTime.now())
    //           .isNegative) {
    //         delayedMap.add(e);
    //       } else {
    //         onTrackMap.add(e);
    //       }
    //     }
    //   });
    //   print("i was called");
    //   print(onTrackMap);
    //   print("other");
    //   print(NotificationsData.onTrackMap);
    // }
//   }
// }
