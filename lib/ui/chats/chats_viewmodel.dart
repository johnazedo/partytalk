

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
      ChatUIModel("João Pedro Limão", "Apenas um teste!", 4, "9:50", "assets/images/avatar.jpg")
    ];
  }

}