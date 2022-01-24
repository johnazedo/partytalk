import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talk/domain/entities/chat.dart';
import 'package:talk/domain/entities/message.dart';

abstract class ChatRepository {
  Stream<List<Chat>> fetchChats(String userEmail);
  Stream<List<Message>> fetchMessages(String chatID, String userEmail);
  Future<bool> sendMessage(Message message, String emailTo, String emailFrom);
}
