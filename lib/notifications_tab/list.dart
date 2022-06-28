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
            "We provide best services in the world. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some ..."),
    onTrack(
        title: "MOU-4",
        date: DateTime.now(),
        description:
            "We provide best services in the world. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some ..."),
  ];
}
