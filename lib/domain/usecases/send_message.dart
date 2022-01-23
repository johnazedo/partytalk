

import 'package:talk/domain/entities/message.dart';
import 'package:talk/domain/repositories/chat_repo.dart';

abstract class SendMessageUseCase{
  Future<bool> call(String message, String emailTo, String emailFrom);
}

class SendMessageUseCaseImpl implements SendMessageUseCase {

  final ChatRepository chatRepository;
  SendMessageUseCaseImpl({required this.chatRepository});

  @override
  Future<bool> call(String message, String emailTo, String emailFrom) {
    final messageObj = Message(text: message, mine: true, read: false, time: "null");
    return chatRepository.sendMessage(messageObj, emailTo, emailFrom);
  }
}