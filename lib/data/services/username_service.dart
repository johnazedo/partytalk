import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserService {
  Future searchUserByUsername(String username);
}

class UsernameServiceImpl implements UserService {
  @override
  Future<QuerySnapshot> searchUserByUsername(String username) {
    return FirebaseFirestore.instance
        .collection("users")
        .where('username', isEqualTo: username).limit(1).get();
  }
}