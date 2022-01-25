import 'package:flutter/cupertino.dart';
import 'package:talk/domain/entities/chat.dart';
import 'package:talk/domain/usecases/firebase_auth.dart';
import 'package:talk/domain/usecases/list_chat.dart';

class ChatsViewModel extends ChangeNotifier {

  final ListChatUseCase listChatUseCase;
  final FirebaseAuthUseCase firebaseAuthUseCase;

  ChatsViewModel({required this.listChatUseCase, required this.firebaseAuthUseCase}){
    listenChat();
  }

  var chats = ValueNotifier<List<Chat>>([]);

  void listenChat(){
    final userEmail = firebaseAuthUseCase.getEmail();
    final stream = listChatUseCase(userEmail!);
    stream.listen((listOfChats) {
      chats.value = listOfChats;
      notifyListeners();
    });
  }

  int getChatListSize() {
    return chats.value.length;
  }

  bool hasMessages(){
    return getChatListSize() != 0;
  }

  bool isLastItem(int index){
    return getChatListSize() - 1 == index;
  }
}