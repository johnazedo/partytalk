
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageResponse {
  late bool mine;
  late bool read;
  late String text;
  late Timestamp time;

  MessageResponse.fromJSON(Map<String, dynamic> json)
      :   mine = json["mine"],
        read = json["read"],
        text = json["text"],
        time = json["time"];
}
