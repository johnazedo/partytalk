import 'package:talk/domain/usecases/event_participants_get_users.dart';
import 'package:talk/ui/screens/event_participants/event_participants_viewmodel.dart';

abstract class EventParticipantsViewModelFactory {
  static EventParticipantsViewModel make() {
    return EventParticipantsViewModel(
        eventsParticipantsUseCase: EventParticipantsUseCaseImpl());
  }
}
