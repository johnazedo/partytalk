import 'package:talk/domain/entities/event.dart';
import 'package:talk/domain/repositories/event_repo.dart';

abstract class ListEventUseCase {
  List<Event> call(String name);
}

class ListEventUseCaseImpl implements ListEventUseCase {
  final EventRepository eventRepository;
  ListEventUseCaseImpl({required this.eventRepository});

  @override
  List<Event> call(String name) {
    return eventRepository.fetchEvents(name);
  }
}
