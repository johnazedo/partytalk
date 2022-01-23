import 'package:firebase_auth/firebase_auth.dart';
import 'package:talk/data/repositories/user_repo.dart';
import 'package:talk/data/services/user_service.dart';
import 'package:talk/domain/usecases/create_user.dart';
import 'package:talk/domain/usecases/firebase_auth.dart';
import 'package:talk/ui/screens/username/username_viewmodel.dart';

abstract class UsernameViewModelFactory {
  static UsernameViewModel make() {
    return UsernameViewModel(
      firebaseAuthUseCase: FirebaseAuthUseCaseImpl(
        firebaseAuth: FirebaseAuth.instance
      ),
      createUserUseCase: CreateUserUseCaseImpl(
        repository: UserRepositoryImpl(
          service: UserServiceImpl(),
        )
      ),
    );
  }
}
