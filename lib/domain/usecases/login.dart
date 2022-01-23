import 'package:talk/domain/repositories/auth_repo.dart';
import 'package:talk/domain/repositories/user_repo.dart';

abstract class LoginUseCase {
  Future<bool> call();
}

class LoginUseCaseImpl implements LoginUseCase {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  LoginUseCaseImpl({required this.authRepository, required this.userRepository});

  @override
  Future<bool> call() async {
    var credentials = await authRepository.signInWithGoogle();
    var user = credentials.user;
    if(user != null){
      return await userRepository.userAlreadyAdded(user.email.toString());
    }
    return false;
  }
}