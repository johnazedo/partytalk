import 'package:flutter/cupertino.dart';
import 'package:talk/domain/states/create_user_state.dart';
import 'package:talk/domain/entities/user.dart';
import 'package:talk/domain/usecases/create_user.dart';

class UsernameViewModel extends ChangeNotifier {
  final CreateUserUseCase createUserUseCase;

  UsernameViewModel({
    required this.createUserUseCase,
  });

  var name = ValueNotifier<String>("João Pedro Limão");
  final state = ValueNotifier<CreateUserState>(CreateUserState.USER_CREATED);

  void createUser(String? username) async {
    if (username != null) {
      var user = User(
        name: "João Pedro",
        email: "jplimao12@gmail.com",
        username: username,
        photoURL: "photo.com"
      );
      state.value = await createUserUseCase(user);
    }

    notifyListeners();
  }

  bool isUserCreated(){
    return state.value == CreateUserState.USER_CREATED;
  }

  bool isUsernameInvalid() {
    return state.value == CreateUserState.USERNAME_INVALID;
  }
}


