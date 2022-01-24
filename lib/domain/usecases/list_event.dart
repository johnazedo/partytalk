import 'package:talk/domain/entities/event.dart';
import 'package:talk/domain/repositories/event_repo.dart';

abstract class ListEventUseCase {
  Future<List<Event>> call(String userEmail);
}

class ListEventUseCaseImpl implements ListEventUseCase {
  final EventRepository eventRepository;
  ListEventUseCaseImpl({required this.eventRepository});

  @override
  Future<List<Event>> call(String userEmail) async {
    return eventRepository.fetchEvents(userEmail);
  }
}
