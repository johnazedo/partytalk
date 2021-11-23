import 'package:talk/domain/create_use_state.dart';
import 'package:talk/domain/entities/user.dart';
import 'package:talk/domain/repositories/user_repository.dart';

abstract class CreateUserUseCase {
  Future<CreateUserState> call(User user);
}

class CreateUserUseCaseImpl implements CreateUserUseCase {
  final UserRepository repository;
  CreateUserUseCaseImpl({required this.repository});

  @override
  Future<CreateUserState> call(User user) async{
    var usernameValid = await repository.isValidUsername(user.username);
    if(!usernameValid) {
      return CreateUserState.USERNAME_INVALID;
    }

    var userCreated = await repository.createUser(user);
    if(userCreated) {
      return CreateUserState.USER_CREATED;
    }

    return CreateUserState.DEFAULT;
  }
}