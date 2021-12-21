

import 'package:talk/domain/entities/chat.dart';
import 'package:talk/domain/repositories/chat_repo.dart';

abstract class ListChatUseCase {
  Future<List<Chat>> call();
}

class ListChatUseCaseImpl implements ListChatUseCase {

  final ChatRepository chatRepository;
  ListChatUseCaseImpl({required this.chatRepository});

  @override
  Future<List<Chat>> call() async {
    return await chatRepository.fetchChats();
  }
}