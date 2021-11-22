import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:talk/data/services/username_service.dart';
import 'package:talk/data/repositories/username_repository.dart';

class UsernameViewModel extends ChangeNotifier {
  final UsernameRepository repository;
  UsernameViewModel({ required this.repository });

  var validUsername = ValueNotifier<bool>(false);

  void createUser(String? username) async {
    if(username != null) {
      validUsername.value = await repository.usernameIsValid(username);
      if (validUsername.value) {
        //CreateUserFunction
      }
    }
  }
}

abstract class UsernameViewModelFactory {
  static UsernameViewModel make(){
    return UsernameViewModel(
      repository: UsernameRepositoryImpl(
          service: UsernameServiceImpl()
      )
    );
  }
}