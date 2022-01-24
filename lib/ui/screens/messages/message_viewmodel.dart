import 'package:flutter/cupertino.dart';
import 'package:talk/domain/entities/message.dart';
import 'package:talk/domain/usecases/firebase_auth.dart';
import 'package:talk/domain/usecases/get_messages.dart';

class MessageViewModel extends ChangeNotifier {

  var messages = ValueNotifier<List<Message>>([]);

  final GetMessagesUseCase getMessagesUseCase;
  final FirebaseAuthUseCase firebaseAuthUseCase;
  MessageViewModel({required this.getMessagesUseCase, required this.firebaseAuthUseCase});

  int getMessagesSize(){
    return messages.value.length;
  }

  void listenStream(String chatID){
    var email = firebaseAuthUseCase.getEmail();
    if(email != null){
      final stream = getMessagesUseCase(chatID, email);
      stream.listen((listOfMessages) {
        messages.value = listOfMessages;
        notifyListeners();
      });
    }
  }
}