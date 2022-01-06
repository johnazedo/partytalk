import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:talk/domain/usecases/list_chat.dart';
import 'chat_uimodel.dart';

class ChatsViewModel extends ChangeNotifier {

  final ListChatUseCase listChatUseCase;
  ChatsViewModel({required this.listChatUseCase});

  var chats = ValueNotifier<List<ChatUIModel>>([]);

  Stream getStreamChat() {
    return listChatUseCase("jplimao12@gmail.com");
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