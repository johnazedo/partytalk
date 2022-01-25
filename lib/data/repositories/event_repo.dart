import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talk/data/repositories/user_repo.dart';
import 'package:talk/data/responses/event_response.dart';
import 'package:talk/data/responses/user_response.dart';
import 'package:talk/domain/entities/event.dart';
import 'package:talk/domain/entities/user.dart';
import 'package:talk/domain/repositories/event_repo.dart';

class EventRepositoryImpl extends EventRepository {
  @override
  Future<List<Event>> fetchEvents(String userEmail) async {
    final querySnapshot = await FirebaseFirestore.instance
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

  @override
  Future<List<User>> fetchParticipants(String eventId) async {
    final documentSnapshot = await FirebaseFirestore.instance
        .collection("events")
        .doc(eventId)
        .get();


    final listOfEmails = List.from(
      await documentSnapshot.get("participants"),
    );

    final querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where('email', whereIn: listOfEmails)
        .get();

    return querySnapshot.docs
        .map(
          (queryDocument) => UserFactory.make(
            UserResponse.fromJSON(
              queryDocument.data(),
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

abstract class UserFactory {
  static User make(UserResponse response) {
    return User(
        email: response.email,
        username: response.username,
        photoURL: response.photoURL,
        name: response.name);
  }
}
