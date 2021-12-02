import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talk/domain/states/create_user_state.dart';
import 'package:talk/domain/usecases/create_user.dart';
import 'package:talk/domain/usecases/firebase_auth.dart';
import 'package:talk/ui/constants/strings.dart';

class UsernameViewModel extends ChangeNotifier {
  final CreateUserUseCase createUserUseCase;
  final FirebaseAuthUseCase firebaseAuthUseCase;

  UsernameViewModel(
      {required this.createUserUseCase, required this.firebaseAuthUseCase}) {
    loadDisplayName();
  }

  var name = ValueNotifier<String>("");
  final state = ValueNotifier<CreateUserState>(CreateUserState.USER_CREATED);

  void createUser(String username) async {
    var user = firebaseAuthUseCase.getUser(username);
    if (user != null) {
      state.value = await createUserUseCase(user);
    }
    notifyListeners();
  }

  String getErrorMessage(){
    switch(state.value) {
      case CreateUserState.USERNAME_INVALID : return Strings.usernameIsInvalid;
      case CreateUserState.USERNAME_UNAVAILABLE: return Strings.usernameIsUnavailable;
      default: return "";
    }
  }

  bool isUsernameInvalidOrUnavailable() {
    return state.value == CreateUserState.USERNAME_INVALID || state.value == CreateUserState.USERNAME_UNAVAILABLE;
  }

  void loadDisplayName() {
    name.value = firebaseAuthUseCase.getDisplayName() ?? "";
    notifyListeners();
  }
}
