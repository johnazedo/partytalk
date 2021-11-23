import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talk/domain/entities/user.dart';

abstract class UserService {
  Future<QuerySnapshot> searchUser(String field, dynamic value);
  Future<DocumentReference> createUser(User user);
}

class UserServiceImpl implements UserService {
  @override
  Future<QuerySnapshot> searchUser(String field, dynamic value) {
    return FirebaseFirestore.instance
        .collection("users")
        .where(field, isEqualTo: value).limit(1).get();
  }

  @override
  Future<DocumentReference> createUser(User user){
    return FirebaseFirestore.instance.collection("users").add(user.toJson());
  }
}