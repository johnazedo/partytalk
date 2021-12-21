import 'package:talk/data/services/chat_service.dart';
import 'package:talk/domain/entities/chat.dart';
import 'package:talk/domain/repositories/chat_repo.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatService chatService;
  ChatRepositoryImpl({required this.chatService});

  @override
  Future<List<Chat>?> fetchChats() async {
      var querySnapshot = await chatService.filterChatsByParticipant("");
      for (var element in querySnapshot.docs) {
        element.data();
      }
      return [];
  }
}