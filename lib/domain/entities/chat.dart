class Chat {
  late String id;
  late String title;
  late String lastMessage;
  late String time;
  String? photoURL;
  int noReadMessageAmount = 0;

  Chat({required this.id, required this.title, required this.lastMessage, required this.time});
}
