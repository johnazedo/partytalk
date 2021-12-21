import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talk/domain/entities/user.dart';

abstract class UserService {
  Future<QuerySnapshot> searchUser(String field, dynamic value);
  Future<DocumentReference> createUser(User user);
  DocumentReference getUserByDocumentId(String documentID);
}

class UserServiceImpl implements UserService {

  static final collection = FirebaseFirestore.instance.collection("users");

  @override
  Future<QuerySnapshot> searchUser(String field, dynamic value) {
    return collection.where(field, isEqualTo: value).limit(1).get();
  }

  @override
  Future<DocumentReference> createUser(User user) async{
    await collection.doc(user.email).set(user.toJson());
    return collection.doc(user.email);
  }

  @override
  DocumentReference getUserByDocumentId(String documentId) {
    return collection.doc(documentId);
  }
}