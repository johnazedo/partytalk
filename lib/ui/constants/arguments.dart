

class ChatToMessageArguments {
  String displayName;
  String? photoURL;
  String email;
  String chatID;

  ChatToMessageArguments({required this.displayName, required this.email, required this.chatID, this.photoURL});
}


class EventToParticipantsArguments {
  String eventId;
  String eventName;

  EventToParticipantsArguments({required this.eventName, required this.eventId});
}