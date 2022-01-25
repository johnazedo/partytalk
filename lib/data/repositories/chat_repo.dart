import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talk/data/responses/chat_response.dart';
import 'package:talk/data/responses/message_response.dart';
import 'package:talk/domain/entities/chat.dart';
import 'package:talk/domain/entities/message.dart';
import 'package:talk/domain/repositories/chat_repo.dart';

class ChatRepositoryImpl implements ChatRepository {
  @override
  Stream<List<Chat>> fetchChats(String userEmail) {
    final snapshots = FirebaseFirestore.instance
        .collection("users")
        .doc(userEmail)
        .collection("chats")
        .orderBy("timeLastMessage", descending: true)
        .snapshots();

    return snapshots.map(
      (querySnapshot) => querySnapshot.docs
          .map(
            (docSnapshot) => ChatFactory.make(
              docSnapshot.id,
              ChatResponse.fromJSON(
                docSnapshot.data(),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Stream<List<Message>> fetchMessages(String chatID, String userEmail) {
    final snapshots = FirebaseFirestore.instance
        .collection("users")
        .doc(userEmail)
        .collection("chats")
        .doc(chatID)
        .collection("message")
        .orderBy('time')
        .snapshots();

    var snap = snapshots.map((querySnapshot) => querySnapshot.docs
        .map(
          (docSnapshot) => MessageFactory.make(
            docSnapshot.id,
            MessageResponse.fromJSON(
              docSnapshot.data(),
            ),
          ),
        )
        .toList());

    return snap;
  }

  @override
  Future<bool> sendMessage(
      Message message, String emailTo, String emailFrom) async {
    final me = FirebaseFirestore.instance.collection("users").doc(emailFrom);
    final addressee =
        FirebaseFirestore.instance.collection("users").doc(emailTo);

    await saveMessageToMe(me, addressee, message);
    saveMessageToAddressee(me, addressee, message);
    return true;
  }

  Future<void> saveMessageToMe(DocumentReference me,
      DocumentReference addressee, Message message) async {
    final chat = me.collection("chats").doc(addressee.id);
    final user = await addressee.get();
    final now = Timestamp.now();

    chat.set({
      'addressee': addressee.id,
      'lastMessage': message.text,
      'photoURL': user.get('photoURL'),
      'timeLastMessage': now,
      'title': user.get('name')
    });

    chat.collection("message").add({
      'mine': message.mine,
      'read': message.read,
      'text': message.text,
      'time': now,
    });
  }

  Future<void> saveMessageToAddressee(DocumentReference me,
      DocumentReference addressee, Message message) async {
    final chat = addressee.collection("chats").doc(me.id);
    final user = await me.get();
    final now = Timestamp.now();

    chat.set({
      'addressee': me.id,
      'lastMessage': message.text,
      'photoURL': user.get('photoURL'),
      'timeLastMessage': now,
      'title': user.get('name')
    });

    chat.collection("message").add({
      'mine': !message.mine,
      'read': message.read,
      'text': message.text,
      'time': now,
    });
  }
}

abstract class ChatFactory {
  static Chat make(String documentID, ChatResponse response) {
    return Chat(
        id: documentID,
        title: response.title,
        lastMessage: response.lastMessage,
        photoURL: response.photoURL,
        time: formatTimestamp(response.timeLastMessage),
        addresseeEmail: response.addressee);
  }

  static String formatTimestamp(Timestamp timestamp) {
    return "${timestamp.toDate().hour}:${timestamp.toDate().minute}";
  }
}

abstract class MessageFactory {
  static Message make(String documentID, MessageResponse response) {
    return Message(
      id: documentID,
      mine: response.mine,
      text: response.text,
      time: formatTimestamp(response.time),
    );
  }

  static String formatTimestamp(Timestamp timestamp) {
    return "${timestamp.toDate().day}/${timestamp.toDate().month}/${timestamp.toDate().year} ${timestamp.toDate().hour}:${timestamp.toDate().minute}";
  }
}
