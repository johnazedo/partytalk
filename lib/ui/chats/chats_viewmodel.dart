

import 'package:flutter/cupertino.dart';
import 'package:talk/ui/chats/chat_uimodel.dart';

class ChatsViewModel extends ChangeNotifier {

  var chats = ValueNotifier<List<ChatUIModel>>([]);

  void getChats() {
    chats.value = [
      ChatUIModel("João Pedro Limão", "Apenas um teste!", 4, "9:50", "assets/images/avatar.jpg"),
      ChatUIModel("João Pedro Limão", "Apenas um teste!", 4, "9:50", "assets/images/avatar.jpg"),
      ChatUIModel("João Pedro Limão", "Apenas um teste!", 4, "9:50", "assets/images/avatar.jpg"),
      ChatUIModel("João Pedro Limão", "Apenas um teste!", 4, "9:50", "assets/images/avatar.jpg"),
      ChatUIModel("João Pedro Limão", "Apenas um teste!", 4, "9:50", "assets/images/avatar.jpg"),
      ChatUIModel("João Pedro Limão", "Apenas um teste!", 4, "9:50", "assets/images/avatar.jpg"),
      ChatUIModel("João Pedro Limão", "Apenas um teste!", 4, "9:50", "assets/images/avatar.jpg"),
      ChatUIModel("João Pedro Limão", "Apenas um teste!", 4, "9:50", "assets/images/avatar.jpg"),
      ChatUIModel("Luis Filipe Limão", "Apenas um teste!", 4, "9:50", "assets/images/avatar.jpg"),
      ChatUIModel("Luis Filipe Limão", "Apenas um teste!", 4, "9:50", "assets/images/avatar.jpg"),
      ChatUIModel("Luis Filipe Limão", "Apenas um teste!", 4, "9:50", "assets/images/avatar.jpg"),
      ChatUIModel("Luis Filipe Limão", "Apenas um teste!", 4, "9:50", "assets/images/avatar.jpg"),
      ChatUIModel("João Pedro Limão", "Apenas um teste!", 4, "9:50", "assets/images/avatar.jpg"),
      ChatUIModel("João Pedro Limão", "Apenas um teste!", 4, "9:50", "assets/images/avatar.jpg"),
      ChatUIModel("João Pedro Limão", "Apenas um teste!", 4, "9:50", "assets/images/avatar.jpg"),
      ChatUIModel("João Pedro Limão", "Apenas um teste!", 4, "9:50", "assets/images/avatar.jpg"),
    ];
  }

  int getChatListSize() {
    return chats.value.length;
  }

  bool isLastItem(int index){
    return getChatListSize() - 1 == index;
  }

}