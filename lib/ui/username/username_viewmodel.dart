import 'package:flutter/cupertino.dart';
import 'package:talk/domain/usecases/is_valid_username.dart';

class UsernameViewModel extends ChangeNotifier {
  final IsValidUsernameUseCase isValidUsernameUseCase;

  UsernameViewModel({
    required this.isValidUsernameUseCase
  });

  var validUsername = ValueNotifier<bool>(false);

  void createUser(String? username) {
    validUsername.value = isValidUsernameUseCase(username);
    if (validUsername.value) {
      // CreateUser
    }
  }
}


