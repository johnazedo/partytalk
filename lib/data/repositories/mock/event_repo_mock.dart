import 'package:talk/domain/entities/event.dart';
import 'package:talk/domain/repositories/event_repo.dart';

class EventRepositoryMockImpl implements EventRepository {
  @override
  List<Event> fetchEvents(String name) {
    return [
      Event(id: "1", name: "Campus Party", numberParticipants: 1024),
      Event(id: "2", name: "Aula DDM", numberParticipants: 41),
      Event(id: "3", name: "Aula PAA", numberParticipants: 15),
      Event(id: "4", name: "Formatura 2021.1", numberParticipants: 126),
      Event(id: "5", name: "Python Brasil", numberParticipants: 57),
      Event(id: "6", name: "Aula EVP", numberParticipants: 23),
      Event(id: "7", name: "Reunião empresa", numberParticipants: 5),
      Event(id: "8", name: "Amigos", numberParticipants: 7),
      Event(id: "9", name: "Aula FMC2", numberParticipants: 67),
      Event(id: "10", name: "TCC da Thais", numberParticipants: 34)
    ];
  }
}
