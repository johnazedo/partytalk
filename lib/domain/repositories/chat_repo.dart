import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talk/domain/entities/chat.dart';

abstract class ChatRepository {
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchChats(String userEmail);
}
