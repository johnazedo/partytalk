class ToMessageArguments {
  String displayName;
  String? photoURL;
  String email;

  ToMessageArguments({required this.displayName, required this.email, this.photoURL});
}


class EventToParticipantsArguments {
  String eventId;
  String eventName;

  EventToParticipantsArguments({required this.eventName, required this.eventId});
}