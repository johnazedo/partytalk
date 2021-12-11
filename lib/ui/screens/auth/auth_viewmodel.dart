import 'package:flutter/cupertino.dart';
import 'package:talk/domain/usecases/login.dart';

class AuthViewModel extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  AuthViewModel({required this.loginUseCase});

  var userAlreadyCreated = ValueNotifier<bool>(false);

  Future<void> signIn() async {
    userAlreadyCreated.value = await loginUseCase();
    notifyListeners();
  }

}