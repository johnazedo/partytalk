

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talk/domain/entities/user.dart';

class ChatResponse {
  late String lastMessage;
  late String title;
  late String photoURL;
  late DocumentReference addressee;
  late Timestamp timeLastMessage;

  ChatResponse.fromJSON(Map<String, dynamic> json)
    :   lastMessage = json["lastMessage"],
        addressee = json["addressee"],
        photoURL = json["photoURL"],
        title = json["title"],
        timeLastMessage = json["timeLastMessage"];
}