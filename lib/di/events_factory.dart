import 'package:firebase_auth/firebase_auth.dart';
import 'package:talk/data/repositories/event_repo.dart';
import 'package:talk/domain/usecases/firebase_auth.dart';
import 'package:talk/domain/usecases/list_event.dart';
import 'package:talk/ui/screens/events/events_viewmodel.dart';

abstract class EventsViewModelFactory {
  static EventsViewModel make() {
    return EventsViewModel(
      listEventUseCase: ListEventUseCaseImpl(
        eventRepository: EventRepositoryImpl(),
      ),
      firebaseAuthUseCase: FirebaseAuthUseCaseImpl(
        firebaseAuth: FirebaseAuth.instance,
      ),
    );
  }
}
