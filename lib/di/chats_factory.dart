import 'package:firebase_auth/firebase_auth.dart';
import 'package:talk/data/repositories/chat_repo.dart';
import 'package:talk/domain/usecases/firebase_auth.dart';
import 'package:talk/domain/usecases/list_chat.dart';
import 'package:talk/ui/screens/chats/chats_viewmodel.dart';

abstract class ChatsViewModelFactory {
  static ChatsViewModel make() {
    return ChatsViewModel(
      firebaseAuthUseCase: FirebaseAuthUseCaseImpl(
          firebaseAuth: FirebaseAuth.instance
      ),
      listChatUseCase: ListChatUseCaseImpl(
          chatRepository: ChatRepositoryImpl()
      ),
    );
  }
}