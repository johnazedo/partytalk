

import 'package:talk/domain/entities/chat.dart';

abstract class ChatRepository {
  Future<List<Chat>> fetchChats();
}
