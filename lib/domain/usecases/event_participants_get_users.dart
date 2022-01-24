import 'package:talk/domain/entities/user.dart';

abstract class EventParticipantsUseCase {
  Future<List<User>> getUsers(String eventName);
}

class EventParticipantsUseCaseImpl implements EventParticipantsUseCase {
  @override
  Future<List<User>> getUsers(String eventName) {
    return Future.delayed(const Duration(seconds: 1), () {
      return [
        User(
            name: "João Pedro Limão",
            email: "limaoNaHorta@gmail.com",
            username: "Limon",
            photoURL: "assets/images/avatar.jpg")
      ];
    });
  }
}
