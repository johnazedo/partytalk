import 'package:flutter/material.dart';
import 'package:talk/domain/usecases/firebase_auth.dart';
import 'package:talk/domain/usecases/logout.dart';

class CustomDrawerViewModel extends ChangeNotifier {
  final FirebaseAuthUseCase firebaseAuthUseCase;
  final LogoutUseCase logoutUseCase;
  CustomDrawerViewModel(
      {required this.firebaseAuthUseCase, required this.logoutUseCase}) {
    getUserDisplayName();
    getUserEmail();
  }

  var userDisplayName = ValueNotifier<String>('');
  var userEmail = ValueNotifier<String>('');

  void getUserDisplayName() {
    userDisplayName.value =
        firebaseAuthUseCase.getDisplayName() ?? "Nome do usuário";
  }

  void getUserEmail() {
    userEmail.value = firebaseAuthUseCase.getEmail() ?? "email@gmail.com";
  }

  Future<void> logout() async {
    await logoutUseCase();
    notifyListeners();
  }
}
