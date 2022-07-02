import 'package:cloud_firestore/cloud_firestore.dart';

class CreationDetails {
  static Map<String, dynamic> quantities = {};

  static void mapping(String itemId, dynamic val) {
    quantities[itemId] = val;
    print("quantities:");
    print(quantities);
  }

  static Future addData() async {
    final mou = FirebaseFirestore.instance.collection('MOUs').doc('mou5');

    await mou.set(quantities);
  }

  static Stream<Map<String, dynamic>> getData() {
    return FirebaseFirestore.instance
        .collection('MOUs')
        .doc('mou1')
        .snapshots()
        .map((event) => event.data()!);
  }

  static showData() {
    Stream<Map<String, dynamic>> stream;
    stream = getData();
    stream.listen((event) {
      print("My data is:");
      print(event);
    });
  }
}
