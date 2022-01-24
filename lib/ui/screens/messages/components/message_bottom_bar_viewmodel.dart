

import 'package:flutter/cupertino.dart';
import 'package:talk/domain/usecases/firebase_auth.dart';
import 'package:talk/domain/usecases/send_message.dart';

class MessageBottomBarViewModel extends ChangeNotifier {

  var showSendButton = ValueNotifier<bool>(false);

  final SendMessageUseCase sendMessageUseCase;
  final FirebaseAuthUseCase firebaseAuthUseCase;
  MessageBottomBarViewModel({required this.sendMessageUseCase, required this.firebaseAuthUseCase});

  void changeVisibilitySendButton(String message){
    showSendButton.value = message.isNotEmpty;
    notifyListeners();
  }

  void sendMessage(String message, String emailAddress) async{
    var email = firebaseAuthUseCase.getEmail();
    if(email != null) {
      await sendMessageUseCase(message, emailAddress, email);
    }
  }
}