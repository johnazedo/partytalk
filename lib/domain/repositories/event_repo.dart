import 'package:talk/domain/entities/event.dart';
import 'package:talk/domain/entities/user.dart';

abstract class EventRepository {
  Future<List<Event>> fetchEvents(String userEmail);
  Future<List<User>> fetchParticipants(String eventId);
}
