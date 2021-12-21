

import 'package:flutter/cupertino.dart';
import 'package:talk/domain/entities/chat.dart';
import 'package:talk/domain/usecases/list_chat.dart';
import 'chat_uimodel.dart';

class ChatsViewModel extends ChangeNotifier {

  final ListChatUseCase listChatUseCase;
  ChatsViewModel({required this.listChatUseCase});

  var chats = ValueNotifier<List<Chat>>([]);

  void getChats() async {
    chats.value = await listChatUseCase();
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