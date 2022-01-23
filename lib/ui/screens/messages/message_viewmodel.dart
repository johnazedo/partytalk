import 'package:flutter/cupertino.dart';
import 'package:talk/domain/entities/message.dart';
import 'package:talk/domain/usecases/get_messages.dart';

class MessageViewModel extends ChangeNotifier {

  var messages = ValueNotifier<List<Message>>([]);

  final GetMessagesUseCase getMessagesUseCase;
  MessageViewModel({required this.getMessagesUseCase}){
    listenStream();
  }

  int getMessagesSize(){
    return messages.value.length;
  }

  void listenStream(){
    final stream = getMessagesUseCase("EevGs8LCEsYu6UpWNYFM", "jplimao12@gmail.com");
    stream.listen((listOfMessages) {
      messages.value = listOfMessages;
      notifyListeners();
    });
  }
}