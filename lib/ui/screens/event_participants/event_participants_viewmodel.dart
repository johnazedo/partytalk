import 'package:flutter/cupertino.dart';
import 'package:talk/domain/entities/user.dart';
import 'package:talk/domain/usecases/event_participants_get_users.dart';

class EventParticipantsViewModel extends ChangeNotifier {
  EventParticipantsUseCaseImpl eventsParticipantsUseCase;

  var eventName = "";

  EventParticipantsViewModel({required this.eventsParticipantsUseCase});

  Future<Map<String, List<User>>> getUsersOrderly() async {
    final usersFromApi = await eventsParticipantsUseCase.getUsers(eventName);

    //ordering users
    Map<String, List<User>> result = {};
    List<String> lettes = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("");
    for (var letter in lettes) {
      result[letter] = [];
    }
    for (var user in usersFromApi) {
      result[user.name[0].toUpperCase()]!.add(user);
    }

    return result;
  }
}
