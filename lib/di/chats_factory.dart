import 'package:talk/data/repositories/chat_repo.dart';
import 'package:talk/data/services/chat_service.dart';
import 'package:talk/data/services/user_service.dart';
import 'package:talk/domain/usecases/list_chat.dart';
import 'package:talk/ui/screens/chats/chats_viewmodel.dart';

abstract class ChatsViewModelFactory {
  static ChatsViewModel make() {
    return ChatsViewModel(
      listChatUseCase: ListChatUseCaseImpl(
          chatRepository: ChatRepositoryImpl(
            chatService: ChatServiceImpl(),
            userService: UserServiceImpl()
          )
      ),
    );
  }
}