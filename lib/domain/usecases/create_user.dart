import 'package:talk/domain/states/create_user_state.dart';
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
    await repository.createUser(user);
    return CreateUserState.USER_CREATED;
  }
}