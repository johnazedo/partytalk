import 'package:talk/domain/entities/user.dart';
import 'package:talk/domain/repositories/user_repository.dart';

abstract class CreateUserUseCase {
  Future<bool> call(User user);
}

class CreateUserUseCaseImpl implements CreateUserUseCase {
  final UserRepository repository;
  CreateUserUseCaseImpl({required this.repository});

  @override
  Future<bool> call(User user) async{
    var userAlreadyAdded = await repository.userAlreadyAdded(user);
    if(!userAlreadyAdded){
      return await repository.createUser(user);
    }
    return false;
  }
}