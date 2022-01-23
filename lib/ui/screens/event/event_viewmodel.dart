import 'package:flutter/material.dart';
import 'package:talk/domain/entities/user.dart';

class EventViewModel extends ChangeNotifier {
  var eventName = ValueNotifier<String>("");

  var users = ValueNotifier<List<User>>([
    User(
        name: "João Pedro Limão",
        email: "limaoNaHorta@gmail.com",
        username: "Limon",
        photoURL: "assets/images/avatar.jpg")
  ]);

  bool hasUsers() {
    return users.value.isNotEmpty;
  }

  Map<String, List<User>> getUsersOrderly() {
    //TODO search users on BD on event with the eventName field and replace users

    //ordering users
    Map<String, List<User>> result = {};
    List<String> lettes = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("");
    for (var letter in lettes) {
      result[letter] = [];
    }
    for (var user in users.value) {
      result[user.name[0].toUpperCase()]!.add(user);
    }

    return result;
  }
}
