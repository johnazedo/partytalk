import 'package:firebase_auth/firebase_auth.dart';
import 'package:talk/data/repositories/chat_repo.dart';
import 'package:talk/domain/usecases/firebase_auth.dart';
import 'package:talk/domain/usecases/send_message.dart';
import 'package:talk/ui/screens/messages/components/message_bottom_bar_viewmodel.dart';

abstract class MessageBottomBarViewModelFactory {
  static MessageBottomBarViewModel make() {
    return MessageBottomBarViewModel(
      sendMessageUseCase: SendMessageUseCaseImpl(
        chatRepository: ChatRepositoryImpl(),
      ), firebaseAuthUseCase: FirebaseAuthUseCaseImpl(firebaseAuth: FirebaseAuth.instance),
    );
  }
}
