import 'package:talk/domain/repositories/auth_repo.dart';

abstract class LogoutUseCase {
  Future<void> call();
}

class LogoutUseCaseImpl implements LogoutUseCase {
  final AuthRepository authRepository;
  LogoutUseCaseImpl({required this.authRepository});

  @override
  Future<void> call() async {
    authRepository.signOutOfGoogle();
  }
}
