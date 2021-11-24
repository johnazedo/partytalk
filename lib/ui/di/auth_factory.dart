import 'package:talk/data/repositories/auth_repository.dart';
import 'package:talk/data/repositories/user_repository.dart';
import 'package:talk/data/services/user_service.dart';
import 'package:talk/domain/usecases/login.dart';
import 'package:talk/ui/auth/auth_viewmodel.dart';

abstract class AuthViewModelFactory {
  static AuthViewModel make() {
    return AuthViewModel(
      loginUseCase: LoginUseCaseImpl(
         userRepository: UserRepositoryImpl(
           service: UserServiceImpl()
         ),
        authRepository: AuthRepositoryImpl()
      ),
    );
  }
}