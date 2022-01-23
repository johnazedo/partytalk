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
        .snapshots();

    return snapshots.map(
      (querySnapshot) => querySnapshot.docs
          .map(
            (docSnapshot) => MessageFactory.make(
              docSnapshot.id,
              MessageResponse.fromJSON(
                docSnapshot.data(),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Future<bool> sendMessage(
      Message message, String emailTo, String emailFrom) async {
    final me = FirebaseFirestore.instance.collection("users").doc(emailFrom);
    final addressee =
        FirebaseFirestore.instance.collection("users").doc(emailTo);

    await saveMessageToMe(me, addressee, message);
    await saveMessageToAddressee(me, addressee, message);
    return true;
  }

  Future<void> saveMessageToMe(DocumentReference me,
      DocumentReference addressee, Message message) async {
    final chat = await me
        .collection("chats")
        .where("addressee", isEqualTo: addressee)
        .limit(1)
        .get();
    late String chatId;
    final user = await addressee.get();
    final now = Timestamp.now();

    if (chat.docs.isEmpty) {
      final photoURL = await user.get('photoURL');
      final displayName = await user.get('name');
      final docRef = await me.collection("chats").add({
        'addressee': addressee,
        'lastMessage': message.text,
        'photoURL': photoURL,
        'timeLastMessage': now,
        'title': displayName
      });
      chatId = docRef.id;
    } else {
      chatId = chat.docs.first.id;
    }

    me.collection("chats").doc(chatId).collection("message").add({
      'mine': message.mine,
      'read': message.read,
      'text': message.text,
      'time': now,
    });
  }

  Future<void> saveMessageToAddressee(DocumentReference me,
      DocumentReference addressee, Message message) async {
    final chat = await addressee
        .collection("chats")
        .where("addressee", isEqualTo: me)
        .limit(1)
        .get();
    late String chatId;
    final user = await me.get();
    final now = Timestamp.now();

    if (chat.docs.isEmpty) {
      final photoURL = await user.get('photoURL');
      final displayName = await user.get('name');
      final docRef = await addressee.collection("chats").add({
        'addressee': me,
        'lastMessage': message.text,
        'photoURL': photoURL,
        'timeLastMessage': now,
        'title': displayName
      });
      chatId = docRef.id;
    } else {
      chatId = chat.docs.first.id;
    }

    addressee.collection("chats").doc(chatId).collection("message").add({
      'mine': message.mine,
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
        time: formatTimestamp(response.timeLastMessage));
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
