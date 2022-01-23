import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talk/domain/entities/chat.dart';

abstract class ChatRepository {
  Stream<List<Chat>> fetchChats(String userEmail);
}
