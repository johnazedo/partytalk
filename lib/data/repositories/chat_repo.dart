import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talk/data/responses/chat_response.dart';
import 'package:talk/data/services/chat_service.dart';
import 'package:talk/data/services/user_service.dart';
import 'package:talk/domain/entities/chat.dart';
import 'package:talk/domain/repositories/chat_repo.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatService chatService;
  final UserService userService;

  ChatRepositoryImpl({required this.chatService, required this.userService});

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchChats(String userEmail) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userEmail)
        .collection("chats")
        .snapshots();
  }
}

abstract class ChatFactory {
  static Chat make(String documentID, ChatResponse response){
    return Chat(id: documentID, title: response.title, lastMessage: response.lastMessage, time: formatTimestamp(response.timeLastMessage));
  }

  static String formatTimestamp(Timestamp timestamp){
    return "${timestamp.toDate().hour}:${timestamp.toDate().minute}";
  }
}
