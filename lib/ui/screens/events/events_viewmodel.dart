import 'package:flutter/foundation.dart';
import 'package:talk/domain/entities/event.dart';
import 'package:talk/domain/usecases/firebase_auth.dart';
import 'package:talk/domain/usecases/list_event.dart';

class EventsViewModel extends ChangeNotifier {
  final ListEventUseCase listEventUseCase;
  final FirebaseAuthUseCase firebaseAuthUseCase;
  EventsViewModel({required this.listEventUseCase, required this.firebaseAuthUseCase}) {
    fetchEvents();
  }

  var events = ValueNotifier<List<Event>>([]);

  void fetchEvents() async {
    final email = firebaseAuthUseCase.getEmail();
    if(email != null){
      events.value = await listEventUseCase(email);
      notifyListeners();
    }
  }

  int getEventListSize() {
    return events.value.length;
  }

  bool hasEvents() {
    return getEventListSize() != 0;
  }

  bool isLastItem(int index) {
    return getEventListSize() - 1 == index;
  }
}
