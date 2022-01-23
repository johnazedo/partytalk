import 'package:talk/domain/entities/chat.dart';
import 'package:talk/domain/repositories/chat_repo.dart';

abstract class ListChatUseCase {
  Stream<List<Chat>> call(String userEmail);
}

class ListChatUseCaseImpl implements ListChatUseCase {

  final ChatRepository chatRepository;
  ListChatUseCaseImpl({required this.chatRepository});

  @override
  Stream<List<Chat>> call(String userEmail) {
    return chatRepository.fetchChats(userEmail);
  }
}