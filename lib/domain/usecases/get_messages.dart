import 'package:talk/domain/entities/message.dart';
import 'package:talk/domain/repositories/chat_repo.dart';

abstract class GetMessagesUseCase {
  Stream<List<Message>> call(String chatID, String userEmail);
}

class GetMessagesUseCaseImpl implements GetMessagesUseCase {

  final ChatRepository chatRepository;
  GetMessagesUseCaseImpl({required this.chatRepository});

  @override
  Stream<List<Message>> call(String chatID, String userEmail) {
    return chatRepository.fetchMessages(chatID, userEmail);
  }

}