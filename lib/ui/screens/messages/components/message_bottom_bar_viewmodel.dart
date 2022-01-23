

import 'package:flutter/cupertino.dart';
import 'package:talk/domain/usecases/send_message.dart';

class MessageBottomBarViewModel extends ChangeNotifier {

  var showSendButton = ValueNotifier<bool>(false);

  final SendMessageUseCase sendMessageUseCase;
  MessageBottomBarViewModel({required this.sendMessageUseCase});

  void changeVisibilitySendButton(String message){
    showSendButton.value = message.isNotEmpty;
    notifyListeners();
  }

  void sendMessage(String message) async{
    await sendMessageUseCase(message, "johnazedo07@gmail.com", "jplimao12@gmail.com");
  }
}