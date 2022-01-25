import 'package:talk/data/repositories/event_repo.dart';
import 'package:talk/domain/usecases/get_participants.dart';
import 'package:talk/ui/screens/participants/participants_viewmodel.dart';

abstract class EventParticipantsViewModelFactory {
  static EventParticipantsViewModel make() {
    return EventParticipantsViewModel(
      eventsParticipantsUseCase: EventParticipantsUseCaseImpl(
        eventRepository: EventRepositoryImpl(),
      ),
    );
  }
}
