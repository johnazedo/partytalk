

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talk/domain/entities/chat.dart';
import 'package:talk/domain/repositories/chat_repo.dart';

abstract class ListChatUseCase {
  Stream<QuerySnapshot<Map<String, dynamic>>> call(String userEmail);
}

class ListChatUseCaseImpl implements ListChatUseCase {

  final ChatRepository chatRepository;
  ListChatUseCaseImpl({required this.chatRepository});

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> call(String userEmail) {
    return chatRepository.fetchChats(userEmail);
  }

}