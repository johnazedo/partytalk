import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:talk/domain/usecases/login.dart';

class AuthViewModel extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  AuthViewModel({required this.loginUseCase});

  var nameUser = ValueNotifier<String>("");
  var userAlreadyCreated = ValueNotifier<bool>(false);

  void signIn() async {
    userAlreadyCreated.value = await loginUseCase();
    if(!userAlreadyCreated.value){
      User? user = FirebaseAuth.instance.currentUser;
      if(user != null) {
        nameUser.value = user.displayName!;
      }
    }
    notifyListeners();
  }
}