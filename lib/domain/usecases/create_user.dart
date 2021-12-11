import 'package:talk/domain/states/create_user_state.dart';
import 'package:talk/domain/entities/user.dart';
import 'package:talk/domain/repositories/user_repository.dart';

abstract class CreateUserUseCase {
  Future<CreateUserState> call(User user);
}

class CreateUserUseCaseImpl implements CreateUserUseCase {
  final UserRepository repository;
  CreateUserUseCaseImpl({required this.repository});

  final MIN_CHAR_USERNAME = 3;

  @override
  Future<CreateUserState> call(User user) async{
    if(user.username.length > MIN_CHAR_USERNAME){
      var usernameValid = await repository.isValidUsername(user.username);
      if(usernameValid){
        await repository.createUser(user);
        return CreateUserState.USER_CREATED;
      } else {
        return CreateUserState.USERNAME_UNAVAILABLE;
      }
    }
    return CreateUserState.USERNAME_INVALID;
  }
}