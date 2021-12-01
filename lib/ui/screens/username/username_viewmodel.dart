import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:talk/domain/states/create_user_state.dart';
import 'package:talk/domain/entities/user.dart' as entities;
import 'package:talk/domain/usecases/create_user.dart';

class UsernameViewModel extends ChangeNotifier {
  final CreateUserUseCase createUserUseCase;

  UsernameViewModel({
    required this.createUserUseCase,
  }){
    loadDisplayName();
  }

  var name = ValueNotifier<String>("");
  final state = ValueNotifier<CreateUserState>(CreateUserState.USER_CREATED);

  void createUser(String? username) async {
    if (username != null) {
      var user = _getUser(username);
      if (user != null) {
        state.value = await createUserUseCase(user);
      }
    }
    notifyListeners();
  }

  bool isUserCreated() {
    return state.value == CreateUserState.USER_CREATED;
  }

  bool isUsernameInvalid() {
    return state.value == CreateUserState.USERNAME_INVALID;
  }

  entities.User? _getUser(String username) {
    var firebaseUser = FirebaseAuth.instance.currentUser;
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

  void loadDisplayName(){
    var firebaseUser = FirebaseAuth.instance.currentUser;
    if(firebaseUser != null) {
      name.value = firebaseUser.displayName!;
    }
    notifyListeners();
  }
}
