

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talk/sample/clean/usecase_sample.dart';

class RepositoryImpl implements Repository {
  @override
  Stream<List<DocumentReference>> getChats(String userEmail) async* {
    List<DocumentReference> documentsReference = [];
    final snapshots = FirebaseFirestore.instance
        .collection("users")
        .doc(userEmail)
        .collection("chats")
        .snapshots();


    snapshots.listen((querySnapshot) {
      documentsReference = [];
      print("Testing");
      querySnapshot.docChanges.forEach((element) {
        documentsReference.add(element.doc.get("ref"));
      });
    });

    print("Testing 2");

    yield documentsReference;
  }
}