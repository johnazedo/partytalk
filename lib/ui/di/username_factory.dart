import 'package:talk/data/repositories/user_repository.dart';
import 'package:talk/data/services/user_service.dart';
import 'package:talk/domain/repositories/user_repository.dart';
import 'package:talk/domain/usecases/create_user.dart';
import 'package:talk/domain/usecases/is_valid_username.dart';
import 'package:talk/ui/username/username_viewmodel.dart';

abstract class UsernameViewModelFactory {
  static UsernameViewModel make() {
    var repository = UserRepositoryImpl(
      service: UserServiceImpl(),
    );
    return UsernameViewModel(
      isValidUsernameUseCase: IsValidUsernameUseCaseImpl(
        repository: repository,
      ),
      createUserUseCase: CreateUserUseCaseImpl(
        repository: repository
      ),
    );
  }
}
