import 'package:talk/domain/repositories/valid_username.dart';

abstract class IsValidUsernameUseCase {
  bool call(String? username);
}

class IsValidUsernameUseCaseImpl implements IsValidUsernameUseCase {
  final IsValidUsernameRepository repository;
  IsValidUsernameUseCaseImpl({ required this.repository });

  @override
  bool call(String? username) {
    var result = false;
    if(username == null){
      return result;
    }
    repository(username).then((value) => result=value);
    return result;
  }
}