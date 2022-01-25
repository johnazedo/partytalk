import 'package:flutter/cupertino.dart';
import 'package:talk/domain/entities/user.dart';
import 'package:talk/domain/usecases/get_participants.dart';

class EventParticipantsViewModel extends ChangeNotifier {

  var participants = ValueNotifier<Map<String, List<User>>>({});

  final EventParticipantsUseCase eventsParticipantsUseCase;
  EventParticipantsViewModel({required this.eventsParticipantsUseCase});

  getParticipants(String eventId) async {
    participants.value = await eventsParticipantsUseCase.getParticipants(eventId);
    notifyListeners();
  }
}
