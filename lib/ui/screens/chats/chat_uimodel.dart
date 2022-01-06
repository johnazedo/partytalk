import 'package:cloud_firestore/cloud_firestore.dart';

class ChatUIModel {
  final String? id;
  final String personName;
  final String lastMessage;
  final int amountMessage;
  final Timestamp date;
  final String? photoUrl;

  ChatUIModel(this.id, this.personName, this.lastMessage, this.amountMessage, this.date, this.photoUrl);

  ChatUIModel.fromStream(DocumentSnapshot document):
      id = null,
      personName = document.get('title'),
      lastMessage = document.get('lastMessage'),
      amountMessage = 0,
      photoUrl = null,
      date = document.get('timeLastMessage');
}



