import 'package:talk/domain/entities/event.dart';

abstract class EventRepository {
  Future<List<Event>> fetchEvents(String userEmail);
}
