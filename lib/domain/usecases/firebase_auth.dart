import 'package:firebase_auth/firebase_auth.dart';
import 'package:talk/domain/entities/user.dart' as entities;


abstract class FirebaseAuthUseCase {
  entities.User? getUser(String username);
  String? getDisplayName();
}

class FirebaseAuthUseCaseImpl implements FirebaseAuthUseCase{
  final FirebaseAuth firebaseAuth;
  FirebaseAuthUseCaseImpl({
   required  this.firebaseAuth
  });

  @override
  String? getDisplayName() {
    var firebaseUser = firebaseAuth.currentUser;
    if(firebaseUser != null) {
      return firebaseUser.displayName!;
    }
    return null;
  }

  @override
  entities.User? getUser(String username) {
    var firebaseUser = firebaseAuth.currentUser;
    if (firebaseUser != null) {
      var user = entities.User(
          name: firebaseUser.displayName!,
          email: firebaseUser.email!,
          username: username,
          photoURL: firebaseUser.photoURL!);
      return user;
    }
    return null;
  }
}