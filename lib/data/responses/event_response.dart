

class EventResponse {
  late String name;
  List<String> participants;
  String? photoURL;

  EventResponse(
      {required this.name,
        required this.participants,
        this.photoURL});

  EventResponse.fromJSON(Map<String, dynamic> json) :
      name = json["name"],
      participants = List.from(json["participants"]),
      photoURL = json["photoURL"];

}