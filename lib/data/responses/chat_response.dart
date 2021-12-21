

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatResponse {
  late String lastMessage;
  late String title;
  late List<dynamic> participants;
  late Timestamp timeLastMessage;

  ChatResponse.fromJSON(Map<String, dynamic> json)
    :   lastMessage = json["lastMessage"],
        participants = json["participants"],
        title = json["title"],
        timeLastMessage = json["timeLastMessage"];
}