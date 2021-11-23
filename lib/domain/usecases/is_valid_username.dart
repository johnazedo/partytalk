import 'package:talk/domain/repositories/user_repository.dart';

abstract class IsValidUsernameUseCase {
  Future<bool> call(String? username);
}

class IsValidUsernameUseCaseImpl implements IsValidUsernameUseCase {
  final UserRepository repository;
  IsValidUsernameUseCaseImpl({ required this.repository });

  @override
  Future<bool> call(String? username) async {
    if(username == null){
      return false;
    }
    return repository.isValidUsername(username);
  }
}