import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talk/data/responses/event_response.dart';
import 'package:talk/domain/entities/event.dart';
import 'package:talk/domain/repositories/event_repo.dart';

class EventRepositoryImpl extends EventRepository {
  @override
  Future<List<Event>> fetchEvents(String userEmail) async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection("events")
        .where("participants", arrayContains: userEmail)
        .get();
    return querySnapshot.docs
        .map(
          (queryDocumentSnapshot) => EventFactory.make(
            queryDocumentSnapshot.id,
            EventResponse.fromJSON(
              queryDocumentSnapshot.data(),
            ),
          ),
        )
        .toList();
  }
}

abstract class EventFactory {
  static Event make(String documentID, EventResponse response) {
    return Event(
      id: documentID,
      name: response.name,
      numberParticipants: response.participants.length,
      photoURL: response.photoURL,
    );
  }
}
