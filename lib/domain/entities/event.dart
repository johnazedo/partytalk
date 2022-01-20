class Event {
  late String id;
  late String name;
  int numberParticipants;
  String? photoURL;

  Event(
      {required this.id,
      required this.name,
      required this.numberParticipants,
      this.photoURL});
}
