import 'package:talk/data/repositories/mock/event_repo_mock.dart';
import 'package:talk/domain/usecases/list_event.dart';
import 'package:talk/ui/screens/events/events_viewmodel.dart';

abstract class EventsViewModelFactory {
  static EventsViewModel make() {
    return EventsViewModel(
        listEventUseCase:
            ListEventUseCaseImpl(eventRepository: EventRepositoryMockImpl()));
  }
}
