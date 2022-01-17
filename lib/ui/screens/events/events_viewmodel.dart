import 'package:flutter/foundation.dart';
import 'package:talk/domain/entities/event.dart';
import 'package:talk/domain/usecases/list_event.dart';

class EventsViewModel extends ChangeNotifier {
  final ListEventUseCase listEventUseCase;
  EventsViewModel({required this.listEventUseCase}) {
    fetchEvents("");
  }

  var events = ValueNotifier<List<Event>>([]);

  void fetchEvents(String name) {
    events.value = listEventUseCase.call(name);
    notifyListeners();
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
