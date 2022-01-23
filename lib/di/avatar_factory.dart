import 'package:firebase_auth/firebase_auth.dart';
import 'package:talk/domain/usecases/firebase_auth.dart';
import 'package:talk/ui/components/avatar/avatar_viewmodel.dart';

abstract class AvatarViewModelFactory {
  static AvatarViewModel make() {
    return AvatarViewModel(
      firebaseAuthUseCase: FirebaseAuthUseCaseImpl(
          firebaseAuth: FirebaseAuth.instance
      ),
    );
  }
}