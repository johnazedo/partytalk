import 'package:talk/domain/entities/user.dart';
import 'package:talk/domain/repositories/event_repo.dart';

abstract class EventParticipantsUseCase {
  Future<Map<String, List<User>>> getParticipants(String eventId);
}

class EventParticipantsUseCaseImpl implements EventParticipantsUseCase {

  final EventRepository eventRepository;
  EventParticipantsUseCaseImpl({required this.eventRepository});

  @override
  Future<Map<String, List<User>>> getParticipants(String eventId) async {
    final listOfParticipants = await eventRepository.fetchParticipants(eventId);
    Map<String, List<User>> result = {};
    List<String> lettes = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("");
    for (var letter in lettes) {
      result[letter] = [];
    }
    for (var user in listOfParticipants) {
      result[user.name[0].toUpperCase()]!.add(user);
    }

    return result;
  }
}
