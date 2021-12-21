import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatService {
  Future<QuerySnapshot<Map<String, dynamic>>> filterChatsByParticipant(DocumentReference docRef);
}

class ChatServiceImpl implements ChatService{

  static final collection = FirebaseFirestore.instance.collection("chats");

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> filterChatsByParticipant(DocumentReference docRef) {
    return collection.where("participants", arrayContains: docRef).get();
  }
}