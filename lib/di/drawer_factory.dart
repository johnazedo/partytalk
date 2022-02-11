import 'package:firebase_auth/firebase_auth.dart';
import 'package:talk/data/repositories/auth_repo.dart';
import 'package:talk/domain/usecases/firebase_auth.dart';
import 'package:talk/domain/usecases/logout.dart';
import 'package:talk/ui/components/drawer/drawer_viewmodel.dart';

abstract class CustomDrawerViewModelFactory {
  static CustomDrawerViewModel make() {
    return CustomDrawerViewModel(
      firebaseAuthUseCase:
          FirebaseAuthUseCaseImpl(firebaseAuth: FirebaseAuth.instance),
      logoutUseCase: LogoutUseCaseImpl(authRepository: AuthRepositoryImpl()),
    );
  }
}
