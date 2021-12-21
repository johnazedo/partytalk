import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatService {
  Future<QuerySnapshot> filterChatsByParticipant(String userEmail);
}

class ChatServiceImpl implements ChatService{

  static var collection = FirebaseFirestore.instance.collection("chats");

  @override
  Future<QuerySnapshot> filterChatsByParticipant(String userEmail) {
    return collection.where("participants", arrayContains: userEmail).get();
  }
}