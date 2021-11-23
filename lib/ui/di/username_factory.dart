import 'package:talk/data/repositories/valid_username.dart';
import 'package:talk/data/services/user.dart';
import 'package:talk/domain/usecases/is_valid_username.dart';
import 'package:talk/ui/username/username_viewmodel.dart';

abstract class UsernameViewModelFactory {
  static UsernameViewModel make() {
    var repository = IsValidUsernameRepositoryImpl(
      service: UserServiceImpl(),
    );
    return UsernameViewModel(
      isValidUsernameUseCase: IsValidUsernameUseCaseImpl(
        repository: repository,
      ),
    );
  }
}
