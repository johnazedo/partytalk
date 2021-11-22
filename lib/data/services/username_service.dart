import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UsernameService {
  Future searchUserByUsername(String username);
}

class UsernameServiceImpl implements UsernameService {
  @override
  Future<QuerySnapshot> searchUserByUsername(String username) {
    return FirebaseFirestore.instance
        .collection("users")
        .where('username', isEqualTo: username).limit(1).get();
  }
}