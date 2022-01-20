import 'package:talk/domain/entities/event.dart';

abstract class EventRepository {
  List<Event> fetchEvents(String name);
}
