import 'package:flutter/cupertino.dart';
import 'package:talk/domain/entities/user.dart';
import 'package:talk/domain/usecases/create_user.dart';
import 'package:talk/domain/usecases/is_valid_username.dart';

class UsernameViewModel extends ChangeNotifier {
  final IsValidUsernameUseCase isValidUsernameUseCase;
  final CreateUserUseCase createUserUseCase;

  UsernameViewModel({
    required this.isValidUsernameUseCase,
    required this.createUserUseCase,
  });

  var validUsername = ValueNotifier<bool>(true);
  var userCreated = ValueNotifier<bool>(false);

  void createUser(String? username) async {
    validUsername.value = await isValidUsernameUseCase(username);

    if (validUsername.value) {
      var user = User(
        name: "João Pedro",
        email: "jplimao12@gmail.com",
        username: username!,
        photoURL: "photo.com"
      );

      userCreated.value = await createUserUseCase(user);
    }

    notifyListeners();
  }
}


